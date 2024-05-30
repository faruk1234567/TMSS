import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/foreign_trainee_model.dart';
import '../repository/foreign_trainee_repository.dart';

class ForeignTrainingController extends GetxController {
  RxList<ForeignTraineeModel> totalForeignTraineeList =
      <ForeignTraineeModel>[].obs;

  var isLoading = false.obs;
  var uniqueSchoolNames = <dynamic>{}.obs;
  //var uniqueCourses=<Map<String,String>>[].obs;

  getTotalForeignTraineeData() async {
    isLoading.value = true;
    var response = await ForeignTraineeRepo().getForeignTrainingList();
    totalForeignTraineeList.value = response;
    uniqueSchoolNames.addAll(
        totalForeignTraineeList.map((course) => course.schoolName).toSet());
    // data ashena

    // uniqueSchoolNames.addAll(totalForeignTraineeList.map((course) => course.course).toSet());
    //data ashe

    isLoading.value = false;
  }

  @override
  void onInit() {
    getTotalForeignTraineeData();
    super.onInit();
  }
}
