

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/storage.dart';
import '../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../model/Examevaluation_list_model.dart';
import '../repository/Examevuluation_repository.dart';







class ExamEvuluationController extends GetxController {

  var ExamEvuluationList=<ExamEvuluationModel>[];
  var SchoolIdLeast = BaseSchoolIdModel().obs;
  var searchList = <ExamEvuluationModel>[].obs;


  var isLoading = false.obs;

  getExamEvuluationData(
      ) async {
    isLoading.value = true;
    var response = await ExamEvuluationRepo().getExamEvuluationList(baseSchoolNameId:storage.read('branchId'));
    ExamEvuluationList.clear();
    ExamEvuluationList.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
   // print(ExamEvuluationList.value);
  }

  getSchoolDetailData({String? bSchoolId} )async{
    isLoading.value=true;
    var response=await BaseSchoolRepo().getBaseSchoolDetail(bSchoolId:bSchoolId);
    SchoolIdLeast.value=response;
    isLoading.value=true;


  }
  void search(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      searchList.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    searchList.assignAll(ExamEvuluationList.where((item) => item.course!.toLowerCase().contains(query.toLowerCase()) || item.courseTitle!.toLowerCase().contains(query.toLowerCase())));

    update(); // Update the UI after filtering
  }
  @override
  void onInit() {
    getSchoolDetailData(bSchoolId: storage.read('branchId'));
    getExamEvuluationData();
    super.onInit();
  }
}
