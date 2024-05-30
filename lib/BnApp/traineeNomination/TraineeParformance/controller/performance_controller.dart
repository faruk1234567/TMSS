import 'package:get/get.dart';
import 'package:navy_project/BnApp/traineeNomination/models/trainee_nomination_model.dart';
import 'package:navy_project/BnApp/traineeNomination/repository/trainee_nomination_repo.dart';

import '../model/parformance_model.dart';
import '../repository/parformance_repository.dart';


class TraineeParformanceController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  RxList<ParformanceList> perfList = <ParformanceList>[].obs;
  var isLoading = false.obs;

  getParformeData({int? courseDurationId,int? baseSchoolNameId,
    int? traineeId}) async {
    isLoading.value = true;
    var response = await ParformanceRepo().ParformanceApiCall(courseDurationId: courseDurationId,
        baseSchoolNameId:baseSchoolNameId,traineeId:traineeId);
    perfList.clear();
    //traineeNominationList.addAll(response);
    perfList.value=response;

    isLoading.value = false;


  }
  @override
  void onInit() {
    getParformeData();
    super.onInit();
  }
}
