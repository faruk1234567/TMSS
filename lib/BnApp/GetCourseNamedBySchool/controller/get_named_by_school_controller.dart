import 'package:get/get.dart';

import '../model/get_course_named_by_school_model.dart';
import '../repository/get_course_named_by_school_repo.dart';

class GetCoursenamedBySchool extends GetxController {
  RxList<GetCourseNamedBySchool> NamedCourseByList =
      <GetCourseNamedBySchool>[].obs;

  var isLoading = false.obs;
  var uniqueNamedSchool = <String>{}.obs;

  CourseNamedBySchool() async {
    isLoading.value = true;
    var response = await NamedBySchoolRepo().getCourseNamedBySchool();
    NamedCourseByList.value = response;
    uniqueNamedSchool
        .addAll(NamedCourseByList.map((course) => course.schoolname!).toSet());
    print(uniqueNamedSchool);
    isLoading.value = false;
  }

  @override
  void onInit() {
    CourseNamedBySchool();
    super.onInit();
  }
}
