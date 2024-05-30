import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Repository/Foreign_Course_repo.dart';
import '../model/Foreign_course_model.dart';

class ForeignController extends GetxController {
  RxList<RunningForeignCourse> ForeignCourseList = <RunningForeignCourse>[].obs;

  var isLoading = false.obs;

  getForeignCourses() async {
    isLoading.value = true;
    var response = await ForeignCourseRepo().getForeignCourseDetailList();
    ForeignCourseList.value = response;
    isLoading.value = false;
  }

  @override
  void onInit() {
    getForeignCourses();
    super.onInit();
  }
}