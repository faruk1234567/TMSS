import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/get_course_detail_model.dart';
import '../repository/get_course_detail.repository.dart';



class GetCourseNamedDetailController extends GetxController {
  var gcourseNaamedDetails = GetCourseDetailModel().obs;
  var isLoading = false.obs;

  getcourseNamedForSDetail({
    int? courseNameId,
  }) async {
    isLoading.value = true;
    var response = await GetCourseForSubListRepo().getCourseDetail(courseNameId: courseNameId  );
    gcourseNaamedDetails.value = response;
    isLoading.value = false;

    update();
    print(gcourseNaamedDetails.value);
  }
}