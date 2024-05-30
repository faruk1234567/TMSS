

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'Course_Duration_Detail_Repository.dart';
import 'Course_Duration_Detail_model.dart';

class CourseDurtionDetailController extends GetxController {
  // var courseDurationDetailsList = GetCourseDurationDetailList().obs;
  var courseDurationDetailsList=<GetCourseDurationDetailList>[].obs;
  var forInstructorSearch=<GetCourseDurationDetailList>[].obs;

  //eita korle response cust korte hoina kintu iew page e value ashe na
//var courseDurationDetailsList = GetCourseDurationDetailList().obs;
  var isLoading = false.obs;

  getcourseDurationDetail({
    int ? cDurationId,
  }) async {
    isLoading.value = true;
    var response = await CourseDurationDetailsRepo().getCourseDurationDetailList(cDurationId!);
    courseDurationDetailsList.clear();
    courseDurationDetailsList.addAll(response);// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
   // courseDurationDetailsList.clear();
    print(courseDurationDetailsList.value);
  }
  void searchInstructor(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      forInstructorSearch.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    forInstructorSearch.assignAll(courseDurationDetailsList.where((item) => item.pno!.toLowerCase().contains(query.toLowerCase()) ||item.course!.toLowerCase().contains(query.toLowerCase()) || item.courseTitle!.toLowerCase().contains(query.toLowerCase())));


    update(); // Update the UI after filtering
  }

/*@override
  void onInit() {
    getcourseDurationDetail();
    super.onInit();
  }*/
}
