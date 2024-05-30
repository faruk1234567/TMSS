import 'package:get/get.dart';

import '../model/Get_course_country_bySchool_model.dart';
import '../repository/Get_course_country_bySchool_repo.dart';






class GetCourseBySchool extends GetxController {
  RxList<GetCourseCountryBySchool> CountryCourseByList = <GetCourseCountryBySchool>[].obs;

  var isLoading = false.obs;
  var uniqueCountrySchoolNames = <String>{}.obs;

  CourseCountryBySchool() async {
    isLoading.value = true;
    var response = await CountryBySchoolRepo().getCourseCountryBySchool();
    CountryCourseByList.value = response;
    uniqueCountrySchoolNames.addAll(CountryCourseByList.map((course) => course.baseName!).toSet());
    print(uniqueCountrySchoolNames);
    isLoading.value = false;
  }

  @override
  void onInit() {
    CourseCountryBySchool();
    super.onInit();
  }
}
