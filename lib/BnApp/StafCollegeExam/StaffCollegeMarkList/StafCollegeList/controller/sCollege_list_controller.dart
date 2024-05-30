import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/sta_model.dart';
import '../repository/scList_repo.dart';



class ScollegeListController extends GetxController {
  var SCList = SCListModel().obs;
  var isLoading = false.obs;

  getStaffCollegeList({
    int? cDurationId,
  }) async {
    isLoading.value = true;
    var response = await ScollegeListRepo().getSCollegeCourseDurationDetail(cDurationId!);
    SCList.value = response;
    isLoading.value = false;

    update();
    print(SCList.value);
  }
}