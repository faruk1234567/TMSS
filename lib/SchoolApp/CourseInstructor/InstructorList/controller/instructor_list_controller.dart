

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../api/storage.dart';
import '../../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../../TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../model/instructor_list_model.dart';
import '../repository/instructor_list_repository.dart';








class SchoolCourseBySubjectController extends GetxController {

  var CourseByInstructorList=<CourseInstructorListModel>[].obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;
  var searchList = <CourseInstructorListModel>[].obs;


  var isLoading = false.obs;

  getSchInstructorList({ int? courseNameId,int?courseDurationId}
      ) async {
    isLoading.value = true;
    var response = await SchoolCourrseInstructorListRepo().getSchoolCourseByInstructor(baseschoolnameid:storage.read('branchId'),courseNameId:courseNameId,courseDurationId:courseDurationId);
    CourseByInstructorList.clear();
    CourseByInstructorList.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(CourseByInstructorList.value);
  }
  void search(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      searchList.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    searchList.assignAll(CourseByInstructorList.where((item) => item.course!.toLowerCase().contains(query.toLowerCase()) || item.courseTitle!.toLowerCase().contains(query.toLowerCase())));

    update(); // Update the UI after filtering
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
  //  getSchInstructorList();
    super.onInit();
  }
}
