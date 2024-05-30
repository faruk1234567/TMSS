
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Repository/qExam_Repository.dart';
import '../model/qExam_model.dart';


class QexamController extends GetxController {
  RxList<QExam> QexamCourseList = <QExam>[].obs;

  var isLoading = false.obs;

  getQexamServiseCourses() async {
    isLoading.value = true;
    var response = await qExamServiseRepo().getQexamSerViseCourse();
    QexamCourseList.value = response;
    isLoading.value = false;
  }

  @override
  void onInit() {
    getQexamServiseCourses();
    super.onInit();
  }
}