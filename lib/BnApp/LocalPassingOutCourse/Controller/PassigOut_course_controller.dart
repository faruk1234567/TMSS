import 'package:get/get.dart';

import '../Model/Local_passingOut_course_model.dart';
import '../Repository/Local_passingout_repository.dart';




class PassingoutCourseController extends GetxController {
  RxList<LocalPassingModel> PassingOutCourseList = <LocalPassingModel>[].obs;

  var isLoading = false.obs;
  var uniqueSchoolNames = <String>{}.obs;
  var forPassingSearch=<LocalPassingModel>[].obs;

  getPassingOutCourses() async {
    isLoading.value = true;
    var response = await PassingOutCourseRepo().getPassingOutDataSourse();
    PassingOutCourseList.value = response;
    uniqueSchoolNames.addAll(PassingOutCourseList.map((course) => course.schoolName!).toSet());
    print(uniqueSchoolNames);
    isLoading.value = false;
  }
  void searPassing(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      forPassingSearch.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    forPassingSearch.assignAll(PassingOutCourseList.where((item) => item.course!.toLowerCase().contains(query.toLowerCase()) || item.courseTitle!.toLowerCase().contains(query.toLowerCase())));


    update(); // Update the UI after filtering
  }

  @override
  void onInit() {
    getPassingOutCourses();
    super.onInit();
  }
}
