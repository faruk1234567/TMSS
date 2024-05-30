import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/Course_week_duration_model.dart';
import '../repository/Course_week_duration_repository.dart';

class CourseWeekController extends GetxController {
  var courseByWeekDetailsList = <CourseWeekDurationModel>[].obs;
  var forCourseSearch = <CourseWeekDurationModel>[].obs;

  var isLoading = false.obs;

  getcourseDurationDetail({
    int? cDurationId,
  }) async {
    isLoading.value = true;
    var response = await CourseByWeekDurationDetailsRepo()
        .getCourseByWeekDurationDetail(cDurationId!);
    courseByWeekDetailsList.clear();
    courseByWeekDetailsList.addAll(response); // eta kivabe solve kora jai

    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(courseByWeekDetailsList.value);
  }
  void searchforCourse(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      forCourseSearch.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    forCourseSearch.assignAll(courseByWeekDetailsList.where((item) => item.weekName!.toLowerCase().contains(query.toLowerCase())||item.weekName.toLowerCase().contains(query.toLowerCase())));


    update(); // Update the UI after filtering
  }
/*@override
  void onInit() {
    getcourseDurationDetail();
    super.onInit();
  }*/
}
