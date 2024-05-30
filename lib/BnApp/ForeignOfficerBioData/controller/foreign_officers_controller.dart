import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../CivilOfficersBiodata/model/Civil_model.dart';
import '../repository/Foreign_officers_biodata_repository.dart';

class ForeignOfficerController extends GetxController {
  var FODataDetails = <Items>[].obs;
  var isLoading = false.obs;
  RxInt pageNumber = 1.obs;

  getForeignOfficerDetail() async {
    isLoading.value = true;
    var response = await ForeignOfficerRepositoryRepo().getForeignOfficerModelData(pageNumber.value);
    FODataDetails.clear();
    FODataDetails.addAll(response);
    isLoading.value = false;

    update();
    print(FODataDetails.length);
  }

  var foreignDataList = <Items>[].obs;
  var searchList = <Items>[].obs;

  getAllForeignOfficerDetail() async {
    isLoading.value = true;
    var response = await ForeignOfficerRepositoryRepo().allForiegnDataList(1);
    foreignDataList.clear();
    foreignDataList.addAll(response);
    isLoading.value = false;

    update();
    print(">>>>>>>>>FFFFFFF>>>>>>>>>${foreignDataList.length}");
  }

  void search(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      searchList.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    searchList.assignAll(foreignDataList.where((item) => item.name!.toLowerCase().contains(query.toLowerCase()) || item.pno!.toLowerCase().contains(query.toLowerCase())));

    update(); // Update the UI after filtering
  }

  @override
  void onInit() {
    //getForeignOfficerDetail();
    getAllForeignOfficerDetail();
    super.onInit();
  }
}