import 'package:get/get.dart';

import '../model/instructor_list_model.dart';
import '../repository/instructor_list_repository.dart';



class InstructorController extends GetxController {
  RxList<InstructorModel> instructorFunctionalModel =
      <InstructorModel>[].obs;

  var isLoading = false.obs;
  var forInstructorSearch=<InstructorModel>[].obs;


  getInstructorFunction({int?baseSchoolNameId,int?courseNameId,int?courseDurationId}) async {
    isLoading.value = true;
    var response = await instructorRepo().getInstructorList(baseSchoolNameId:baseSchoolNameId,courseNameId:courseNameId,courseDurationId:courseDurationId);
    instructorFunctionalModel.value = response;

   // print(uniqueNamedSchool);
    isLoading.value = false;
  }
  void searchInstructor(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      forInstructorSearch.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    forInstructorSearch.assignAll(instructorFunctionalModel.where((item) => item.name!.toLowerCase().contains(query.toLowerCase()) ||item.pno!.toLowerCase().contains(query.toLowerCase()) ));


    update(); // Update the UI after filtering
  }
  @override
  void onInit() {
    getInstructorFunction();
    super.onInit();
  }


}

