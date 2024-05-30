import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



import '../../../SchoolApp/TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../../api/storage.dart';
import '../model/mist_model.dart';
import '../repository/mist_repository.dart';






class MistController extends GetxController {

  var MistDetails = <Items>[].obs;
  var isLoading = false.obs;
  RxInt pageNumber = 1.obs;


  getMistDetailData (
      ) async {
    isLoading.value = true;
    var response = await MistRepository().getMistModelData(pageNumber:pageNumber.value );
    MistDetails.clear();
    MistDetails.addAll(response);
    isLoading.value = false;

    update();
    print(MistDetails.length);
  }

  @override
  void onInit() {

   // getSchoolRutineData();
    super.onInit();
  }
}