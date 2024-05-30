

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/storage.dart';
import '../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../model/course_instructor_model.dart';
import '../repository/course_instructor_repository_repository.dart';






class CourseInstructorController extends GetxController {

  var CourseInstructorList=<CourseInstructorModel>[].obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;

 // var SList = <CourseInstructorModel>[].obs;
  var searchList = <CourseInstructorModel>[].obs;


  var isLoading = false.obs;

  getSchoolCInstructorList(
      ) async {
    isLoading.value = true;
    var response = await CourseInstructorRepo().getCourseInstructorList(baseSchoolNameId:storage.read('branchId'));
    CourseInstructorList.clear();
    CourseInstructorList.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(CourseInstructorList.value);
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
    searchList.assignAll(CourseInstructorList.where((item) => item.course!.toLowerCase().contains(query.toLowerCase()) || item.courseTitle!.toLowerCase().contains(query.toLowerCase())));

    update(); // Update the UI after filtering
  }

  @override
  void onInit() {
    //getSchoolDetailData(bSchoolId: storage.read('branchId'));
    getSchoolCInstructorList();
    super.onInit();
  }
}
