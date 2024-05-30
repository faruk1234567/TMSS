import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'Course_Repository.dart';
import 'Course_model.dart';

class CourseDetailController extends GetxController {
  var courseDurationDetails = GetCourseDurationDetail().obs;
  var isLoading = false.obs;

  getcourseDetail({
    int? cDurationId,
  }) async {
    isLoading.value = true;
    var response = await CourseDetailsRepo().getCourseDurationDetail(cDurationId!);
    courseDurationDetails.value = response;
    isLoading.value = false;

    update();
    print(courseDurationDetails.value);
  }
}