

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/storage.dart';
import '../../TotalTraineeList/model/School_base_name_detail_model.dart';
import '../../TotalTraineeList/repository/School_base_name_detail_repository.dart';
import '../NameOftheCourse/model/nameOfThe_model.dart';
import '../NameOftheCourse/repository/NameOfThe_course_repository.dart';
import '../model/course_subject_list.model.dart';
import '../repository/course_subject_list_repository.dart';
import '../subjectTotalByCourse/model/subjectTotal_model.dart';
import '../subjectTotalByCourse/repository/subject_total_mark_repo.dart';







class SchoolCourseSubjectController extends GetxController {

  var CourseBySubjectListList=<SchoolCourseSubjectListModel>[].obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;
  var NameOfTheCourse=NameOftheCourseModel().obs;
  var SubTotalMark=<SubjectTotalMarkModel>[].obs;
  var uniqueModuleNameSchool = <String>{}.obs;


  var isLoading = false.obs;

  getSchSubjectCourseList({ int? courseNameId}
      ) async {
    isLoading.value = true;
    var response = await SchoolCourseSubjectListRepo().getSchoolCourseSubjectList(baseschoolnameid:storage.read('branchId'),courseNameId:courseNameId);
    CourseBySubjectListList.clear();
    CourseBySubjectListList.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(CourseBySubjectListList.value);
  }
  getNameOfTheCourse({int ?id})async{
    isLoading.value = true;
    var response= await NameOfTheCourseRepo().getNameOfTheCourseDetail(id: id);
    NameOfTheCourse.value=response;
    isLoading.value = false;
    update();
    print(NameOfTheCourse.value);


  }
  getSchSubjectTotalMarke({ int? courseNameId}
      ) async {
    isLoading.value = true;
    var response = await SubjectTotalMarkRepo().getSubjectTotalMark(baseschoolnameid:storage.read('branchId'),courseNameId:courseNameId);
    SubTotalMark.clear();
    SubTotalMark.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(SubTotalMark.value);
  }


  getSchoolDetailData({String? bSchoolId} )async{
    isLoading.value=true;
    var response=await BaseSchoolRepo().getBaseSchoolDetail(bSchoolId:bSchoolId);
    SchoolIdLeast.value=response;
    isLoading.value=true;


  }
  @override
  void onInit() {
    getSchoolDetailData(bSchoolId: storage.read('branchId'));
    getSchSubjectCourseList();
   // getNameOfTheCourse();
    super.onInit();
  }
}
