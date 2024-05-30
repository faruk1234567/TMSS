

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/staff_college_mark_list_model.dart';
import '../repository/Staff_college_marklist_repo.dart';




class StaffCollegeMarkListController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  var sCMarkLisst =<StaffCMarkModel>[].obs ;
  // RxList<CoursesSubjectList> courseBySubjectLisst = <CoursesSubjectList>[].obs;
  var isLoading = false.obs;

  getsCMarkListData({int? courseDurationId}) async {
    isLoading.value = true;
    var response = await StaffCollegeMarkListRepo().getStaffCollMarkList(courseDurationId:courseDurationId);
    sCMarkLisst.clear();
    //traineeNominationList.addAll(response);
    // courseBySubjectLisst.value=response;
    sCMarkLisst.addAll(response);


    isLoading.value = false;


  }
  @override
  void onInit() {
    getsCMarkListData();
    super.onInit();
  }
}
