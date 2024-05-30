

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/storage.dart';
import '../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../TotalTraineeList/repository/School_base_name_detail_repository.dart';

import '../model/curse_subject_marklist_model.dart';
import '../repository/Course_subject_mark_list_repository.dart';







class CourseSubjectMarkListController extends GetxController {

  var CourseBySubjectListList=<SubjectMarkListModel>[].obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;


  var isLoading = false.obs;

  getSchSubjectMarkeList({ int? courseNameId, int? bnaSubjectNameId}
      ) async {
    isLoading.value = true;
    var response = await CourseSubjectMarkListRepo().getCourseSubjectMarkList(baseschoolnameid:storage.read('branchId'),courseNameId:courseNameId,bnaSubjectNameId:bnaSubjectNameId);
    CourseBySubjectListList.clear();
    CourseBySubjectListList.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(CourseBySubjectListList.value);
  }

  getSchoolDetailData({String? bSchoolId} )async{
    isLoading.value=true;
    var response=await BaseSchoolRepo().getBaseSchoolDetail(bSchoolId:bSchoolId);
    SchoolIdLeast.value=response;
    isLoading.value=true;


  }
  @override
  void onInit() {
    getSchoolDetailData(bSchoolId: storage.read('branchId'));
    getSchSubjectMarkeList();
    super.onInit();
  }
}
