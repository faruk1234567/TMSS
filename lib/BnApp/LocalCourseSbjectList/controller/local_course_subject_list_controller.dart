import 'package:get/get.dart';

import '../CourseInfoBySchoolAndCourse/model/course_info_model.dart';
import '../CourseInfoBySchoolAndCourse/repository/course_info_repository.dart';
import '../model/local_course_subject_list_model.dart';
import '../repository/local_course_subject_list_repository.dart';

class LocalCourseSubjectListController extends GetxController {
  RxList<LocalCourseSubListModel> lCSList = <LocalCourseSubListModel>[].obs;
  var CourseInfowithModelList =<CourseInfoModel>[].obs;
  var serachListSubject=<LocalCourseSubListModel>[].obs;

  var isLoading = false.obs;
  var uniqueSchoolNames = <dynamic>{}.obs;

  LocalCourseSubjectByList({int? baseSchoolNameId, int? courseNameId}) async {
    isLoading.value = true;
    var response = await LcourseSListRepo().getLocalCourseSubjectList(
        baseSchoolNameId: baseSchoolNameId, courseNameId: courseNameId);
    lCSList.value = response;
    uniqueSchoolNames
        .addAll(lCSList.map((course) => course.courseModule).toSet());
    print(uniqueSchoolNames);
    isLoading.value = false;
  }
  getSchoolWithCourseData({int?baseSchoolNameId,int ?courseNameId,int? courseDurationId} )async{
    isLoading.value=true;
    var response=await CourseInfoRepo().getCourseInfoByScAC(baseSchoolNameId:baseSchoolNameId,courseNameId:courseNameId,courseDurationId:courseDurationId);
    CourseInfowithModelList.value=response;
    isLoading.value=true;


  }
  void searchSubjectMarkList(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      serachListSubject.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    serachListSubject.assignAll(lCSList.where((item) => item.totalPeriod!.toLowerCase().contains(query.toLowerCase())||item.totalMark!.toLowerCase().contains(query.toLowerCase())||item.subjectName!.toLowerCase().contains(query.toLowerCase()) ));


    update(); // Update the UI after filtering
  }

  @override
  void onInit() {

    getSchoolWithCourseData();
    super.onInit();
  }
}
