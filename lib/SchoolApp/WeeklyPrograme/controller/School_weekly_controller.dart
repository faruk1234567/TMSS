

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/storage.dart';
import '../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../model/weekly_model.dart';
import '../repository/weekly_repository.dart';




class SchoolWeeklyController extends GetxController {

  var SchoolWList=<SchoolWeeklyModel>[].obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;


  var isLoading = false.obs;

  getSchoolByWeeklyList(
      ) async {
    isLoading.value = true;
    var response = await SchoolWeeklyRepo().getSchoolWeeklyList(baseSchoolNameId:storage.read('branchId'));
    SchoolWList.clear();
    SchoolWList.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(SchoolWList.value);
  }

  getSchoolDetailData({String? bSchoolId} )async{
    isLoading.value=true;
    var response=await BaseSchoolRepo().getBaseSchoolDetail(bSchoolId:bSchoolId);
    SchoolIdLeast.value=response;
    isLoading.value=true;


  }
  @override
  void onInit() {
    getSchoolDetailData(bSchoolId: storage.read('branchId'));
    getSchoolByWeeklyList();
    super.onInit();
  }
}
