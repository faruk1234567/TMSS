import 'package:get/get.dart';

import '../../../SchoolApp/TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../../SchoolApp/TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../../../api/storage.dart';
import '../SLCModel/Shool_loal_ourse_model.dart';
import '../SLCRepository/School_local_course_repository.dart';

class SchoolLocalCourseController extends GetxController {
  RxList<SLoalourseModel> SchoollocalCourseList = <SLoalourseModel>[].obs;

  var isLoading = false.obs;

  var SchoolIdLeast = BaseSchoolIdModel().obs;
 // var SList = <SLoalourseModel>[].obs;
  var searchList = <SLoalourseModel>[].obs;




  getSchoollocalCourses() async {
    isLoading.value = true;
    var response = await SchoolLocalCourseRepo().getSchoolLocalCourseDataSourse(
        baseSchoolNameId: storage.read('branchId'));
    SchoollocalCourseList.clear();
    SchoollocalCourseList.addAll(response);

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
    searchList.assignAll(SchoollocalCourseList.where((item) => item.course!.toLowerCase().contains(query.toLowerCase()) || item.courseTitle!.toLowerCase().contains(query.toLowerCase())));

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
    getSchoollocalCourses();
    super.onInit();
  }
}
