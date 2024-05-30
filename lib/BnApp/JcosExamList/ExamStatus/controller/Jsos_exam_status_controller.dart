

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/jcos_exam_status_model.dart';
import '../repository/Jcos_exam_status_repo.dart';





class JoExamStatusController extends GetxController {
  // var courseDurationDetailsList = GetCourseDurationDetailList().obs;
  var ExamStatus=<JExamStatusModel>[].obs;

  //eita korle response cust korte hoina kintu iew page e value ashe na
//var courseDurationDetailsList = GetCourseDurationDetailList().obs;
  var isLoading = false.obs;

  getExamStatus({
    int ? cDurationId,
  }) async {
    isLoading.value = true;
    var response = await JcoExamStatusRepo().getjcosExamStatus(cDurationId: cDurationId);
    ExamStatus.clear();
    ExamStatus.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(ExamStatus.value);
  }
  @override
  void onInit() {
    getExamStatus();
    super.onInit();
  }
}
