import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Repository/staf_college_exam_repository.dart';
import '../model/Staf_college_exam_model.dart';

class StafCollegeExamController extends GetxController {
  RxList<StafCollegeExam> StaffCollegeExamList = <StafCollegeExam>[].obs;

  var isLoading = false.obs;

  getStaffCollegeExamData() async {
    isLoading.value = true;
    var response = await StafCollegeExamRepo().getStaffCollegeExamData();
    StaffCollegeExamList.value = response;
    isLoading.value = false;
  }

  @override
  void onInit() {
    getStaffCollegeExamData();
    super.onInit();
  }
}
