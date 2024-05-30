import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/officer_model.dart';
import '../repository/officer_repository.dart';





class TotalOfficerController extends GetxController {
  RxList<OfficerModel> totalofficerList = <OfficerModel>[].obs;

  var isLoading = false.obs;
  var uniqueSchoolNames = <dynamic>{}.obs;
  var forOfficerSearch=<OfficerModel>[].obs;

  getTotalTraineeData() async {
    isLoading.value = true;
    var response = await RunningOficerRepo().getRunningOfficerList();
    totalofficerList.value = response;
    // uniqueSchoolNames.addAll(totalTraineeList.map((course) => '${course.course}\n${course.courseTitle}').toSet());
    // data ashena
    uniqueSchoolNames.addAll(totalofficerList.map((course) => course.course).toSet());
    //data ashe


    isLoading.value = false;
  }
  void searchforOfficer(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      forOfficerSearch.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    forOfficerSearch.assignAll(totalofficerList.where((item) => item.name!.toLowerCase().contains(query.toLowerCase()) || item.pno!.toLowerCase().contains(query.toLowerCase())));


    update(); // Update the UI after filtering
  }


  @override
  void onInit() {
    getTotalTraineeData();
    super.onInit();
  }
}
