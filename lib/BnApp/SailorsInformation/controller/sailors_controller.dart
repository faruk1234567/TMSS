import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/sailors_model.dart';
import '../repository/sailors_repo.dart';

class TotalSailorController extends GetxController {
  RxList<SailorsModel> totalsailorsList = <SailorsModel>[].obs;

  var isLoading = false.obs;
 // var uniqueSchoolNames = <dynamic>{}.obs;
  var uniqueCourses=<Map<String,String>>[].obs;
  var searchList = <Map<String, String>>[].obs;
  var forSailorsSearch=<SailorsModel>[].obs;

  getTotalSailorData() async {
    isLoading.value = true;
    var response = await RunningSailorsRepo().getRunningSailorsList();
    totalsailorsList.value = response;
    // uniqueSchoolNames.addAll(totalTraineeList.map((course) => '${course.course}\n${course.courseTitle}').toSet());
    // data ashena
   // uniqueSchoolNames
   //     .addAll(totalsailorsList.map((course) => course.course).toSet());
    //data ashe

    Set<String> uniqueCourseNames={};
    for(var course in totalsailorsList ){
      final courseName=course.course??"";
      final courseTitle=course.courseTitle??"";
      if(!uniqueCourseNames.contains(courseName)){
        uniqueCourseNames.add(courseName);
        uniqueCourses.add({'course':courseName,'courseTitle':courseTitle});



      }

    }

    isLoading.value = false;
  }
  void search(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      searchList.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    searchList.assignAll(uniqueCourses.where((item) => item['course']!.toLowerCase().contains(query.toLowerCase()) || item['courseTitle']!.toLowerCase().contains(query.toLowerCase())));

    update(); // Update the UI after filtering
  }
  void searchSailors(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      forSailorsSearch.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    forSailorsSearch.assignAll(totalsailorsList.where((item) => item.name!.toLowerCase().contains(query.toLowerCase()) || item.pno!.toLowerCase().contains(query.toLowerCase())));


    update(); // Update the UI after filtering
  }

  @override
  void onInit() {
    getTotalSailorData();
    super.onInit();
  }
}
