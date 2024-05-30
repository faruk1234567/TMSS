import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/total_trainee_model.dart';
import '../repository/total_trainee_repository.dart';

class TotalTraineeController extends GetxController {
  RxList<TotalTraineeModel> totalTraineeList = <TotalTraineeModel>[].obs;

  var isLoading = false.obs;
  // var uniqueSchoolNames = <dynamic>{}.obs;---------previous
  var uniqueCourses = <Map<String, String>>[].obs;
  var searchList = <Map<String, String>>[].obs;
  //var forTrainee=<TotalTraineeModel>[].obs;
  var forTraineeSearch=<TotalTraineeModel>[].obs;

  getTotalTraineeData() async {
    isLoading.value = true;
    var response = await TotalTraineeRepo().getTotalTraineeList();
    totalTraineeList.clear();
    totalTraineeList.value = response;
    // uniqueSchoolNames.addAll(totalTraineeList.map((course) => '${course.course}\n${course.courseTitle}').toSet());
    // data ashena

    Set<String> uniqueCourseNames = {};
    for (var course in totalTraineeList) {
      final courseName = course.course ?? "";
      final courseTitle = course.courseTitle ?? "";
      if (!uniqueCourseNames.contains(courseName)) {
        uniqueCourseNames.add(courseName);
        uniqueCourses.add({'course': courseName, 'courseTitle': courseTitle});
      }
    }
    // uniqueSchoolNames.addAll(totalTraineeList.map((course) => course.course).toSet()); ---previous
    //data ashe

    isLoading.value = false;
  }
  void search(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      searchList.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    searchList.assignAll(uniqueCourses.where((item) => item['course']!.toLowerCase().contains(query.toLowerCase()) || item['courseTitle']!.toLowerCase().contains(query.toLowerCase())));

    update(); // Update the UI after filtering
  }
  void searchforTrainee(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      forTraineeSearch.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    forTraineeSearch.assignAll(totalTraineeList.where((item) => item.name!.toLowerCase().contains(query.toLowerCase()) || item.pno!.toLowerCase().contains(query.toLowerCase())));


    update(); // Update the UI after filtering
  }


  @override
  void onReady() {
    getTotalTraineeData();
    super.onReady();
  }

  @override
  void onInit() {
    getTotalTraineeData();
    super.onInit();
  }
}
