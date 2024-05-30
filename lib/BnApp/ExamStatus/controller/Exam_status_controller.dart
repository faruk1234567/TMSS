import 'package:get/get.dart';

import '../model/Exam_status_model.dart';
import '../repository/Exam_status_repository.dart';



class ExamStatusListController extends GetxController {
  RxList<ExamStatusModel> ESList = <ExamStatusModel>[].obs;

  var isLoading = false.obs;
  var uniqueSchoolNames = <dynamic>{}.obs;

  ExamSubjectByList({int? courseDurationId}) async {
    isLoading.value = true;
    var response = await ExamStatusRepo().getExamStatusList(
        courseDurationId: courseDurationId);
    ESList.value = response;
    uniqueSchoolNames
        .addAll(ESList.map((course) => course.moduleName).toSet());
    print(uniqueSchoolNames);
    isLoading.value = false;
  }
}
