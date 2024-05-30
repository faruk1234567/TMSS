import 'package:get/get.dart';
import 'package:navy_project/BnApp/traineeNomination/models/trainee_nomination_model.dart';
import 'package:navy_project/BnApp/traineeNomination/repository/trainee_nomination_repo.dart';

class TraineeNominationController extends GetxController {
 // var traineeNominationList = <TraineeNominationModel>[].obs;
  RxList<TraineeNominationModel> traineeNominationList = <TraineeNominationModel>[].obs;
  var isLoading = false.obs;
  var forTraineeNomiSearch=<TraineeNominationModel>[].obs;

  getNomineeData({int? courseDurationId}) async {
    isLoading.value = true;
    var response = await TraineeNominationRepo.nominationApiCall(courseDurationId: courseDurationId);
    traineeNominationList.clear();
    //traineeNominationList.addAll(response);
    traineeNominationList.value=response;

    isLoading.value = false;


  }
  void searchTraineeNomination(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      forTraineeNomiSearch.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    forTraineeNomiSearch.assignAll(traineeNominationList.where((item) => item.pno!.toLowerCase().contains(query.toLowerCase()) ||item.position!.toLowerCase().contains(query.toLowerCase()) || item.name!.toLowerCase().contains(query.toLowerCase())));


    update(); // Update the UI after filtering
  }

  @override
  void onInit() {
    getNomineeData();
    super.onInit();
  }
}
