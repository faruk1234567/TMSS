import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/storage.dart';
import '../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../model/coursenamed_by_School_model.dart';
import '../repository/course_named_by_repository.dart';

class CourseNamedController extends GetxController {
  var CourseList = <CourseByNamedModel>[].obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;
  var searchList = <CourseByNamedModel>[].obs;

  var isLoading = false.obs;

  getCourseListData() async {
    isLoading.value = true;
    var response = await CourseNamedRepo()
        .getCourseNamedByCourse(baseSchoolNameId: storage.read('branchId'));
    CourseList.clear();
    CourseList.addAll(response); // eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(CourseList.value);
  }

  getSchoolDetailData({String? bSchoolId}) async {
    isLoading.value = true;
    var response =
        await BaseSchoolRepo().getBaseSchoolDetail(bSchoolId: bSchoolId);
    SchoolIdLeast.value = response;
    isLoading.value = true;
  }
  void search(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      searchList.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    searchList.assignAll(CourseList.where((item) => item.course!.toLowerCase().contains(query.toLowerCase()) ));

    update(); // Update the UI after filtering
  }

  @override
  void onInit() {
    getSchoolDetailData(bSchoolId: storage.read('branchId'));
    getCourseListData();
    super.onInit();
  }
}
