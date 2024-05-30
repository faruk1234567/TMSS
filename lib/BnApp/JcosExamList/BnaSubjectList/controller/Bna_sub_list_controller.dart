

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/Bna_subjectList_model.dart';
import '../repository/Bna_sub_list_repo.dart';



class BnaSubListController extends GetxController {
  // var courseDurationDetailsList = GetCourseDurationDetailList().obs;
  var bnaSubList=<BnaSubjectListModel>[].obs;

  //eita korle response cust korte hoina kintu iew page e value ashe na
//var courseDurationDetailsList = GetCourseDurationDetailList().obs;
  var isLoading = false.obs;

  getBnaSubjectList({
    int ? cDurationId,
  }) async {
    isLoading.value = true;
    var response = await BnaSubListRepo().getBnaSubDetailList(cDurationId: cDurationId);
    bnaSubList.clear();
    bnaSubList.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(bnaSubList.value);
  }
@override
  void onInit() {
  getBnaSubjectList();
    super.onInit();
  }
}
