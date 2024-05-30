import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



import '../../../api/storage.dart';
import '../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../model/reading_material_upload_model.dart';
import '../repository/Reading_material_repository.dart';






class SchoolReadingMaterialController extends GetxController {

  var SRMateDetails = <Item>[].obs;
  var isLoading = false.obs;
  RxInt pageNumber = 1.obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;

  getSchoolReadingMateData (
      ) async {
    isLoading.value = true;
    var response = await SchoolReadingMaterialRepo().getSchoolRMaterialData(pageNumber:pageNumber.value,baseSchoolNameId:storage.read('branchId') );
    SRMateDetails.clear();
    SRMateDetails.addAll(response);
    isLoading.value = false;

    update();
    print(SRMateDetails.length);
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
    getSchoolReadingMateData();
    super.onInit();
  }
}