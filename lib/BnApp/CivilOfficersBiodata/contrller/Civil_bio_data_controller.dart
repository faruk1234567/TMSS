import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


import '../model/Civil_model.dart';
import '../repository/civil_officers_biodata.repository.dart';







class CivilOffBioController extends GetxController {

  var CivilOBD = <Items>[].obs;
  var isLoading = false.obs;
  RxInt pageNumber = 1.obs;

  getCBdataDetail(
      ) async {
    isLoading.value = true;
    var response = await CivilOfficerBioRepositoryRepo().getCivilOfficerModelData(pageNumber.value);
    CivilOBD.clear();
    CivilOBD.addAll(response);
    isLoading.value = false;

    update();
    print(CivilOBD.length);
  }
  getAllCivilOfficerDetail() async {
    isLoading.value = true;
    var response = await CivilOfficerBioRepositoryRepo().getCivilOfficerModelData(pageNumber.value);
    CivilDataList.clear();
    CivilDataList.addAll(response);
    isLoading.value = false;

    update();
    print(">>>>>>>>>FFFFFFF>>>>>>>>>${CivilDataList.length}");
  }

  var CivilDataList = <Items>[].obs;
  var searchList = <Items>[].obs;

  void search(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      searchList.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    searchList.assignAll(CivilDataList.where((item) => item.name!.toLowerCase().contains(query.toLowerCase()) || item.pno!.toLowerCase().contains(query.toLowerCase())));

    update(); // Update the UI after filtering
  }
  @override
  void onInit() {
    getAllCivilOfficerDetail();
    super.onInit();
  }
}