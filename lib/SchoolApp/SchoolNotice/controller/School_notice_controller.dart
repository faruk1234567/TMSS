

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/storage.dart';
import '../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../model/School_notice_model.dart';
import '../repository/School_notice_repository.dart';



class SchoolNoticeController extends GetxController {

  var SchoolNoticeList=<SchoolNoticeModel>[].obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;


  var isLoading = false.obs;

  getSchoolNoticeList(
   ) async {
    isLoading.value = true;
    var response = await SchoolNoticeRepo().getSchoolNotice(baseSchoolNameId:storage.read('branchId'));
    SchoolNoticeList.clear();
    SchoolNoticeList.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(SchoolNoticeList.value);
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
  getSchoolNoticeList();
    super.onInit();
  }
}
