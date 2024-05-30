import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../model/read_m_model.dart';
import '../repository/read_Mate_up_repo.dart';











class RmateUploadController extends GetxController {

  var ReadUploadDataDetails = <Items>[].obs;
  var isLoading = false.obs;
  RxInt pageNumber = 1.obs;

  getReadMaterialUplodDetail(
      ) async {
    isLoading.value = true;
    var response = await RMUplodRepo().getReadingMuPloadData(pageNumber.value);
    ReadUploadDataDetails.clear();
    ReadUploadDataDetails.addAll(response);
    isLoading.value = false;

    update();
    print(ReadUploadDataDetails.length);
  }
  @override
  void onInit() {
    //getForeignOfficerDetail();
    super.onInit();
  }
}