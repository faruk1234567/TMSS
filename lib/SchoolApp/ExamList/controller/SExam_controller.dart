

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/storage.dart';
import '../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../model/SExam_list_model.dart';
import '../repository/Sexma_repo.dart';








class SchoolExamController extends GetxController {

  var SchoolExamList=<SchoolExamModel>[].obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;

  var uniqueModuleNameSchool = <String>{}.obs;
  var searchList = <SchoolExamModel>[].obs;


  var isLoading = false.obs;

  getSchSchoolExamList(
      ) async {
    isLoading.value = true;
    var response = await SchoolExamRepo().getSchoolExamRepo(baseschoolnameid:storage.read('branchId'));
    SchoolExamList.clear();
    SchoolExamList.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(SchoolExamList.value);
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
    searchList.assignAll(SchoolExamList.where((item) => item.course!.toLowerCase().contains(query.toLowerCase()) || item.courseTitle!.toLowerCase().contains(query.toLowerCase())));

    update(); // Update the UI after filtering
  }
  @override
  void onInit() {
    getSchoolDetailData(bSchoolId: storage.read('branchId'));

    getSchSchoolExamList();
    super.onInit();
  }
}
