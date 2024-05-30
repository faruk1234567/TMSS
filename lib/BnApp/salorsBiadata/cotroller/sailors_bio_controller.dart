import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/sailors_bio_model.dart';
import '../repository/sailors_bio_repository.dart';









class SailorsOfficerController extends GetxController {

  var SailorsDataDetails = <Items>[].obs;
  var isLoading = false.obs;
  RxInt pageNumber = 1.obs;

  getSailorsOfficerDetail(
      ) async {
    isLoading.value = true;
    var response = await SailorsBioRepo().getSailorsBioModelData(pageNumber.value);
    SailorsDataDetails.clear();
    SailorsDataDetails.addAll(response);
    isLoading.value = false;

    update();
    print(SailorsDataDetails.length);
  }
  @override
  void onInit() {
    //getForeignOfficerDetail();
    super.onInit();
  }
}