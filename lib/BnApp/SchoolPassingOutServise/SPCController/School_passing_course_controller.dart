import 'package:get/get.dart';

import '../../../SchoolApp/TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../../SchoolApp/TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../../../api/storage.dart';
import '../SPCModel/School_passing_course_model.dart';
import '../SPCRepository/School_passing_course_repository.dart';


class SchoolPassingCourseController extends GetxController {
  RxList<SPassingourseModel> SchoolPassingCourseList = <SPassingourseModel>[].obs;

  var isLoading = false.obs;

  var SchoolIdLeast = BaseSchoolIdModel().obs;
  var searchList = <SPassingourseModel>[].obs;

  getSchoolPassingCourses() async {
    isLoading.value = true;
    var response = await SchoolPassingCourseRepo().getSchoolPassingCourseDataSource(
        baseSchoolNameId: storage.read('branchId'));
    SchoolPassingCourseList.clear();
    SchoolPassingCourseList.addAll(response);

    isLoading.value = false;
    update();
  }
  void search(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      searchList.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    searchList.assignAll(SchoolPassingCourseList.where((item) => item.course!.toLowerCase().contains(query.toLowerCase()) || item.courseTitle!.toLowerCase().contains(query.toLowerCase())));

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
    getSchoolPassingCourses();
    super.onInit();
  }
}
