
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Repository/Inter_servise_repo.dart';
import '../model/inter_Servise_model.dart';

class InterServiseController extends GetxController {
  RxList<InterServiseCourse> InterServiseCourseList = <InterServiseCourse>[].obs;

  var isLoading = false.obs;

  getInterServiseCourses() async {
    isLoading.value = true;
    var response = await InterServiseRepo().getInterSerViseCourse();
    InterServiseCourseList.value = response;
    isLoading.value = false;
  }

  @override
  void onInit() {
    getInterServiseCourses();
    super.onInit();
  }
}