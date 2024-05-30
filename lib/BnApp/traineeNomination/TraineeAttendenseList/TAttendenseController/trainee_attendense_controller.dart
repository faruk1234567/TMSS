import 'package:get/get.dart';
import 'package:navy_project/BnApp/traineeNomination/models/trainee_nomination_model.dart';
import 'package:navy_project/BnApp/traineeNomination/repository/trainee_nomination_repo.dart';

import '../TAttendenseModel/t_attendense_model.dart';
import '../TAttendenseRepository/trainee_attendense_repository.dart';
import 'package:intl/intl.dart' as intl;

class TraineeAttendenseController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  RxList<TraineeAttendenseModel> traineeAttendenseList = <TraineeAttendenseModel>[].obs;
  var isLoading = false.obs;
  var uniqueDate = <dynamic>{}.obs;

  getTraineeAttendenseData({int? traineeId,int? courseSectionId,
    int? courseDurationId,int?traineeAttendance}) async {
    isLoading.value = true;
    var response = await TraineeAttendenseRepo().traineeAttenCall(courseDurationId: courseDurationId,courseSectionId: courseSectionId,traineeId: traineeId);
    traineeAttendenseList.value=response;
    uniqueDate.addAll(traineeAttendenseList.map((date) => date.attendanceDate).toSet());
    print(uniqueDate);
    isLoading.value = false;



  }

  @override
  void onInit() {
    getTraineeAttendenseData();
    super.onInit();
  }
}
