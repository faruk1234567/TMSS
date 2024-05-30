import 'package:get/get.dart';
import 'package:navy_project/BnApp/traineeNomination/models/trainee_nomination_model.dart';
import 'package:navy_project/BnApp/traineeNomination/repository/trainee_nomination_repo.dart';

import '../model/obtain_course_duration_detail_model.dart';
import '../model/obtain_marklist_model.dart';
import '../model/obtain_trainee_degigntion_model.dart';
import '../model/obtain_trainee_detail_model.dart';
import '../repository/obtain_course_duration_repo.dart';
import '../repository/obtain_mark_list_repository.dart';
import '../repository/obtain_rank_repository.dart';
import '../repository/obtain_trainee_detail_repo.dart';

class ObtainMarkListController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  RxList<ObtainMarkList> obtainMarkList = <ObtainMarkList>[].obs;
  var RankList = ObtainRankModel().obs;
  var CourseDurationDetail=ObtainCourseDurationDetailModel().obs;
  var TraineeDetail=ObtainTraineeDetailModel().obs;
  var isLoading = false.obs;
  var forObTMarkListSearch=<ObtainMarkList>[].obs;

  getTraineeMarkData({int? courseDurationId,int? baseSchoolNameId,
    int? traineeId}) async {
    isLoading.value = true;
    var response = await MarkListRepo().marklistApiCall(courseDurationId: courseDurationId,
        baseSchoolNameId:baseSchoolNameId,traineeId:traineeId);
    obtainMarkList.clear();
    //traineeNominationList.addAll(response);
    obtainMarkList.value=response;

    isLoading.value = false;


  }
  getRankData({int? id})async{
    isLoading.value=true;
    var response=await ObtainRankRepo().getObtainRankDetail(id:id );
    RankList.value=response;
    isLoading.value=true;


  }
  getCourseDurationData({int? id})async{
    isLoading.value=true;
    var response=await ObtainCourseDurationRepo().getObtainCourseDurationDetail(id: id);
    CourseDurationDetail.value=response;
    isLoading.value=true;


  }
  getTraineeDetailData({int? id})async{
    isLoading.value=true;
    var response=await ObtainTraineeRepo().getObtainTraineeDetail(id: id);
    TraineeDetail.value=response;
    isLoading.value=true;



  }
  void searchObtainMarkList(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      forObTMarkListSearch.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    forObTMarkListSearch.assignAll(obtainMarkList.where((item) => item.totalMark!.toLowerCase().contains(query.toLowerCase()) ||item.passMarkBna!.toLowerCase().contains(query.toLowerCase())||item.subjectName!.toLowerCase().contains(query.toLowerCase()) ));


    update(); // Update the UI after filtering
  }


  @override
  void onInit() {
    getTraineeMarkData();
    getRankData();
    getCourseDurationData();
    getTraineeDetailData();
    super.onInit();
  }
}
