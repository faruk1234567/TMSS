
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../InterServiseCourse/Repository/Inter_servise_repo.dart';
import '../model/Jco_model.dart';
import '../repository/Jco_repo.dart';



class JcoController extends GetxController {
  RxList<JcoExam> JcoCourseList = <JcoExam>[].obs;

  var isLoading = false.obs;

  jcoServiseCourses() async {
    isLoading.value = true;
    var response = await JcoServiseRepo().JcoCourse();
    JcoCourseList.value = response;
    isLoading.value = false;
  }

  @override
  void onInit() {
    jcoServiseCourses();
    super.onInit();
  }
}