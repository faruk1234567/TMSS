import 'package:get/get.dart';
import 'package:navy_project/BnApp/traineeNomination/models/trainee_nomination_model.dart';
import 'package:navy_project/BnApp/traineeNomination/repository/trainee_nomination_repo.dart';

import '../model/trainee_bio_detail_model.dart';
import '../repository/trainee_bio_data_repo.dart';



class trineeBioDataListController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  //RxList<TraineeBioDetailModel> TBLList = <TraineeBioDetailModel>[].obs;
  var trblist=<TraineeBioDetailModel>[].obs;


  var isLoading = false.obs;


  getTraineeBioDataInDetail({
    int? traineeId}) async {
    isLoading.value = true;
    var response = await TbioIndetailRepo().traineeBioDataCall(traineeId:traineeId);
    trblist.clear();
    //traineeNominationList.addAll(response);
    trblist.addAll(response);

    isLoading.value = false;


  }






  @override
  void onInit() {
    getTraineeBioDataInDetail();

    super.onInit();
  }
}
