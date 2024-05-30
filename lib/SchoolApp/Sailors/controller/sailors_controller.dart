import 'package:get/get.dart';
import 'package:navy_project/BnApp/traineeNomination/models/trainee_nomination_model.dart';
import 'package:navy_project/BnApp/traineeNomination/repository/trainee_nomination_repo.dart';
import 'package:provider/provider.dart';

import '../../../api/storage.dart';
import '../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../model/sailors_model.dart';
import '../repository/sailors_repository.dart';





class SailorOfficersTraineeController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  RxList<SailorsOfficersModel> SalorsOfficersDataList = <SailorsOfficersModel>[].obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;
  var isLoading = false.obs;
  var uniqueCourses=<String>[].obs;
  var searchList = <String>[].obs;
  var sailorsSearchList=<SailorsOfficersModel>[].obs;

  getTraineeSailorOfficersData(
      ) async {
    print(storage.read('branchId'));
    isLoading.value = true;
    var response = await SailorsOfficersTraineeRepo().getSailorsOfficersTrainee(baseSchoolNameId:storage.read('branchId')
    );
    // SchoolDataList.clear();
    //traineeNominationList.addAll(response);
    isLoading.value = false;
    SalorsOfficersDataList.value=response;
    Set<String> uniqueCourseNames={};
    for(var course in SalorsOfficersDataList ){
      final   courseName=course.course??"";
      final courseTitle=course.courseTitle??"";
      final b=courseName+courseTitle;
      if(!uniqueCourseNames.contains(b)){
        uniqueCourseNames.add(b);
        uniqueCourses.add(b);



      }

    }

    isLoading.value = false;


  }
  void search(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      searchList.clear();
      return;
    }
    // Perform a case-insensitive search for both name and PNO
    searchList.assignAll(uniqueCourses.where((item) => item.toLowerCase().contains(query.toLowerCase())));
    // Update the UI after filtering
    update();
  }
   void forSailorsSEarch(String query){
    if(query.isEmpty){

      sailorsSearchList.clear();
      return;
    }
    sailorsSearchList.assignAll(SalorsOfficersDataList.where((c) => c.pno!.toLowerCase().contains(query.toLowerCase())||c.name!.toLowerCase().contains(query.toLowerCase())||c.position!.toLowerCase().contains(query.toLowerCase())));

   }
  getSchoolDetailData({String? bSchoolId} )async{
    isLoading.value=true;
    var response=await BaseSchoolRepo().getBaseSchoolDetail(bSchoolId:bSchoolId);
    SchoolIdLeast.value=response;
    isLoading.value=true;


  }




  @override
  void onInit() {
    getSchoolDetailData(bSchoolId: storage.read('branchId') );
    getTraineeSailorOfficersData();
    super.onInit();
  }
}
