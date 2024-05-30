

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/Trainee_mark_List_model.dart';
import '../repository/Trainee_markList_qexam_reository.dart';



class TraineeMarkListController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  var traineeMarkLisst =<QexamTraineeMarkListModel>[].obs ;
  // RxList<CoursesSubjectList> courseBySubjectLisst = <CoursesSubjectList>[].obs;
  var isLoading = false.obs;

  getQexamMarkListData({int? courseDurationId}) async {
    isLoading.value = true;
    var response = await TraineeMarkListQexamRepo().getQexamTraineeMarkList(courseDurationId:courseDurationId);
    traineeMarkLisst.clear();
    //traineeNominationList.addAll(response);
    // courseBySubjectLisst.value=response;
    traineeMarkLisst.addAll(response);


    isLoading.value = false;


  }
@override
  void onInit() {
  getQexamMarkListData();
    super.onInit();
  }
}
