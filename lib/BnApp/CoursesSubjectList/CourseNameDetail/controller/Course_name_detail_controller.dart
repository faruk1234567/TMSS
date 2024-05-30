

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/Course_name_detail_model.dart';
import '../repositoy/Course_name_detil_repo.dart';



class CourseNameDetailController extends GetxController {
  // var courseDurationDetailsList = GetCourseDurationDetailList().obs;
  var courseNameDetailsList=CourseNameDetail().obs;

  //eita korle response cust korte hoina kintu iew page e value ashe na
//var courseDurationDetailsList = GetCourseDurationDetailList().obs;
  var isLoading = false.obs;

  getcourseNameDetail({
    int ? courseNameId,
  }) async {
    isLoading.value = true;
    var response = await CourseNameDetailsRepo().getCourseNameDetailServise(courseNameId!);
    //courseNameDetailsList.clear();
    courseNameDetailsList.value=response;// eta kivabe solve kora jai
    // bhai cust korle console error dekhai data ashe na
    isLoading.value = false;

    update();
    // courseDurationDetailsList.clear();
    print(courseNameDetailsList.value);
  }
/*@override
  void onInit() {
    getcourseDurationDetail();
    super.onInit();
  }*/
}
