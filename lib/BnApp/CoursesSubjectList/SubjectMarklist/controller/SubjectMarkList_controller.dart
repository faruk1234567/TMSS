

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/subjectMarkList_model.dart';
import '../repository/Subject_mark_list_repo.dart';



class SubjectMarkListController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  var getsubjctMarkList =<MarkListBySubject>[].obs ;
  // RxList<MarkListBySubject> subjctMarkList = <MarkListBySubject>[].obs;
  var isLoading = false.obs;

  getSubjectMarkListData({int?baseSchoolNameId,int? courseNameId,int?bnaSubjectNameId}) async {
    isLoading.value = true;
    var response = await SubjectMarkListRepo().getSubjectMarkList(baseSchoolNameId: baseSchoolNameId,courseNameId:courseNameId,bnaSubjectNameId:bnaSubjectNameId);
    getsubjctMarkList.clear();
    //traineeNominationList.addAll(response);
    // courseBySubjectLisst.value=response;
    getsubjctMarkList.addAll(response);


    isLoading.value = false;


  }
/*@override
  void onInit() {
    getSubjectListData();
    super.onInit();
  }*/
}
