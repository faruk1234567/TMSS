import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/create_trainee_nom_model.dart';
import '../repository/CTrinee_repo.dart';









class CreateNomiController extends GetxController {

  var CnominationDetails = <Items>[].obs;
  var isLoading = false.obs;
  RxInt pageNumber = 1.obs;


  getTraineeNominationData ({
    int ? courseDurationId
}
      ) async {
    isLoading.value = true;
    var response = await CreateNomiRepository().getTraineeNomineeData(pageNumber:pageNumber.value,courseDurationId:courseDurationId );
    CnominationDetails.clear();
    CnominationDetails.addAll(response);
    isLoading.value = false;

    update();
    print(CnominationDetails.length);
  }

  @override
  void onInit() {

    // getSchoolRutineData();
    super.onInit();
  }
}