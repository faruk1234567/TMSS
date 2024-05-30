import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/Qexam_course_duration_model.dart';
import '../repository/Qexam_course_duration_repository.dart';



class QexamCourseDetailController extends GetxController {
  var QexamcourseDurationDetails = QexamCourseDurationModel().obs;
  var isLoading = false.obs;

  getcourseDetail({
    int? cDurationId,
  }) async {
    isLoading.value = true;
    var response = await QexamCourseDetailsRepo().getQexamCourseDurationDetail(cDurationId!);
    QexamcourseDurationDetails.value = response;
    isLoading.value = false;

    update();
    print(QexamcourseDurationDetails.value);
  }
}