

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../SchoolApp/TotalTraineeList/model/School_base_name_detail_model.dart';

import '../../../../SchoolApp/TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../../../../api/storage.dart';
import '../model/trainee_certificate_model.dart';
import '../reository/Trainee_certificate_repo.dart';









class CertificateValueController extends GetxController {

  var CertificateListValue=<TraineeCertificateModel>[].obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;




  var isLoading = false.obs;

  getCertificateValueList({
    int? courseDurationId,
    int? traineeId}
      ) async {
    isLoading.value = true;
    var response = await TraineeCertificateRepo().getTraineeCertificateValue(baseschoolnameid:storage.read('branchId'),courseDurationId:courseDurationId,traineeId:traineeId  );
    CertificateListValue.clear();
    CertificateListValue.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(CertificateListValue.value);
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

    getCertificateValueList();
    super.onInit();
  }
}
