

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/Course_subject_List_model.dart';
import '../repository/course_subject_list_repository.dart';

class CourseSubjectListController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  var courseBySubjectLisst =<CoursesSubjectList>[].obs ;
 // RxList<CoursesSubjectList> courseBySubjectLisst = <CoursesSubjectList>[].obs;
  var isLoading = false.obs;

  getSubjectListData({int ? baseschoolnameid,int? courseNameId}) async {
    isLoading.value = true;
    var response = await CourseSubjectListRepo().getCourseSubjectList(baseschoolnameid: baseschoolnameid,courseNameId:courseNameId);
    courseBySubjectLisst.clear();
    //traineeNominationList.addAll(response);
   // courseBySubjectLisst.value=response;
    courseBySubjectLisst.addAll(response);


    isLoading.value = false;


  }
  /*@override
  void onInit() {
    getSubjectListData();
    super.onInit();
  }*/
}
