import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



import '../../../api/storage.dart';
import '../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../model/Routine_note_model.dart';

import '../repository/Routine_repo.dart';





class SchoolRutineController extends GetxController {

  var SRutineDetails = <Item>[].obs;
  var isLoading = false.obs;
  RxInt pageNumber = 1.obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;

  getSchoolRutineData (
      ) async {
    isLoading.value = true;
    var response = await SchoolRoutineRepositoryRepo().getSchoolRoutineData(pageNumber:pageNumber.value,baseSchoolNameId:storage.read('branchId') );
    SRutineDetails.clear();
    SRutineDetails.addAll(response);
    isLoading.value = false;

    update();
    print(SRutineDetails.length);
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
    getSchoolRutineData();
    super.onInit();
  }
}