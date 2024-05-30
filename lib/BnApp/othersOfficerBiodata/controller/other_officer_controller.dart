import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../model/others_officesr_model.dart';
import '../repository/others_officer_bio_repository.dart';











class OtherOfficerController extends GetxController {

  var OtherOfficerDataDetails = <Items>[].obs;
  var isLoading = false.obs;
  RxInt pageNumber = 1.obs;

  getOthersOfficerDetail(
      ) async {
    isLoading.value = true;
    var response = await OtherOfficerRepo().getOtherOfficerModelData(pageNumber.value);
    OtherOfficerDataDetails.clear();
    OtherOfficerDataDetails.addAll(response);
    isLoading.value = false;

    update();
    print(OtherOfficerDataDetails.length);
  }
  getAllOthersOfficerDetail(
      ) async {
    isLoading.value = true;
    var response = await OtherOfficerRepo().getOtherOfficerModelData(pageNumber.value);
    OtherOfficerDataList.clear();
    OtherOfficerDataList.addAll(response);
    isLoading.value = false;

    update();
    print(OtherOfficerDataList.length);
  }
  var OtherOfficerDataList = <Items>[].obs;
  var searchList = <Items>[].obs;
  void search(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      searchList.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    searchList.assignAll(OtherOfficerDataList.where((item) => item.name!.toLowerCase().contains(query.toLowerCase()) || item.pno!.toLowerCase().contains(query.toLowerCase())));

    update(); // Update the UI after filtering
  }

  @override
  void onInit() {
    getAllOthersOfficerDetail();
    super.onInit();
  }
}