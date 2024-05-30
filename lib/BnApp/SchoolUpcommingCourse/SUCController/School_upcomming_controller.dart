import 'package:get/get.dart';

import '../../../SchoolApp/TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../../SchoolApp/TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../../../api/storage.dart';
import '../SUCModel/School_upcomming_model.dart';
import '../SUCRepository/School_upcomming_repository.dart';


class SchoolUpcommingCourseController extends GetxController {
  RxList<SupcommingModel> SchoolUpcommingCourseList = <SupcommingModel>[].obs;

  var isLoading = false.obs;

  var SchoolIdLeast = BaseSchoolIdModel().obs;

  getSchoolUpcommingCourses() async {
    isLoading.value = true;
    var response = await SchooUpcommingCourseRepo().getSchoolUpcommingCourseDataSourse(
        baseSchoolNameId: storage.read('branchId'));
    SchoolUpcommingCourseList.clear();
    SchoolUpcommingCourseList.addAll(response);

    isLoading.value = false;
    update();
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
    getSchoolUpcommingCourses();
    super.onInit();
  }
}
