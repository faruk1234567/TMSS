

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/bna_subjectName_By-Course_moel.dart';
import '../repository/bns_subject_name_repository.dart';



class BnaSubjectListController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  var courseByBnaSubjectLisst =<BnaSubjectNameModel>[].obs ;
  // RxList<CoursesSubjectList> courseBySubjectLisst = <CoursesSubjectList>[].obs;
  var isLoading = false.obs;

  getBnaSubjectListData() async {
    isLoading.value = true;
    var response = await BnaSubjectListRepo().getBnaSubjectList();
    courseByBnaSubjectLisst.clear();
    //traineeNominationList.addAll(response);
    // courseBySubjectLisst.value=response;
    courseByBnaSubjectLisst.addAll(response);


    isLoading.value = false;


  }
@override
  void onInit() {
  getBnaSubjectListData();
    super.onInit();
  }
}
