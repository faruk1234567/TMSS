import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/storage.dart';
import '../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../model/Precourse_material_list.dart';
import '../repository/precourse_material_repository.dart';


class PrecourseController extends GetxController {
  var precourseList = <PreCourseMaterialModel>[].obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;
  var searchList = <PreCourseMaterialModel>[].obs;

  var isLoading = false.obs;

  getPreCourseListData() async {
    isLoading.value = true;
    var response = await PreCourseMaterialRepo()
        .getPreCourseMaterial(baseSchoolNameId: storage.read('branchId'));
    precourseList.clear();
    precourseList.addAll(response); // eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(precourseList.value);
  }
  void search(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      searchList.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    searchList.assignAll(precourseList.where((item) => item.course!.toLowerCase().contains(query.toLowerCase()) ));

    update(); // Update the UI after filtering
  }

  getSchoolDetailData({String? bSchoolId}) async {
    isLoading.value = true;
    var response =
    await BaseSchoolRepo().getBaseSchoolDetail(bSchoolId: bSchoolId);
    SchoolIdLeast.value = response;
    isLoading.value = true;
  }

  @override
  void onInit() {
    getSchoolDetailData(bSchoolId: storage.read('branchId'));
    getPreCourseListData();
    super.onInit();
  }
}
