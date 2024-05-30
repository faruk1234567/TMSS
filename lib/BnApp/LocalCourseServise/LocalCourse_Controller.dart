import 'package:get/get.dart';

import 'LocalCourse_Repository.dart';
import 'LocalCourse_model.dart';




class LocalCourseController2 extends GetxController {
  RxList<LocalModel> localCourseList = <LocalModel>[].obs;

  var isLoading = false.obs;
  var uniqueSchoolNames = <String>{}.obs;
  var forLoccalSearch=<LocalModel>[].obs;

  getlocalCourses() async {
    isLoading.value = true;
    var response = await LocalCourseRepo().getLocalCourseDataSourse();
    localCourseList.value = response;
    uniqueSchoolNames.addAll(localCourseList.map((course) => course.schoolName!).toSet());
    print(uniqueSchoolNames);
    isLoading.value = false;
  }
  void searchLocal(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      forLoccalSearch.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    forLoccalSearch.assignAll(localCourseList.where((item) => item.course!.toLowerCase().contains(query.toLowerCase()) || item.courseTitle!.toLowerCase().contains(query.toLowerCase())));


    update(); // Update the UI after filtering
  }

  @override
  void onInit() {
    getlocalCourses();
    super.onInit();
  }
}
