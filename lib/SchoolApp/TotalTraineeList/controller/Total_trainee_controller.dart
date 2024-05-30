import 'package:get/get.dart';
import 'package:navy_project/BnApp/traineeNomination/models/trainee_nomination_model.dart';
import 'package:navy_project/BnApp/traineeNomination/repository/trainee_nomination_repo.dart';
import 'package:provider/provider.dart';

import '../../../api/storage.dart';
import '../model/School_base_name_detail_model.dart';
import '../model/School_total_trainee_model.dart';
import '../repository/School_base_name_detail_repository.dart';
import '../repository/School_total_trainee_repository.dart';



class SchoolTotalTraineeController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  RxList<SchoolTTraineeModel> SchoolDataList = <SchoolTTraineeModel>[].obs;
  var SchoolIdLeast = BaseSchoolIdModel().obs;
  var isLoading = false.obs;
  var uniqueCourses = <String>[].obs;
  var searchList = <String>[].obs;
  var SchtraineeSearch=<SchoolTTraineeModel>[].obs;

  getTraineeData() async {
    print(storage.read('branchId'));
    isLoading.value = true;
    var response = await SchoolTotalTraineeRepo().getSchoolTotalTrainee(
        baseSchoolNameId: storage.read('branchId')
    );
    // SchoolDataList.clear();
    //traineeNominationList.addAll(response);
    isLoading.value = false;
    SchoolDataList.value = response;
    Set<String> uniqueCourseNames = {};
    for (var course in SchoolDataList) {
      final courseName = course.course ?? "";
      final courseTitle = course.courseTitle ?? "";
      final b = courseName + courseTitle;
      if (!uniqueCourseNames.contains(b)) {
        uniqueCourseNames.add(b);
        uniqueCourses.add(b);
      }
    }

    isLoading.value = false;
  }

  getSchoolDetailData({String? bSchoolId}) async {
    isLoading.value = true;
    var response = await BaseSchoolRepo().getBaseSchoolDetail(
        bSchoolId: bSchoolId);
    SchoolIdLeast.value = response;
    isLoading.value = true;
  }

  void search(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      searchList.clear();
      return;
    }
    // Perform a case-insensitive search for both name and PNO
    searchList.assignAll(uniqueCourses.where((item) => item.toLowerCase().contains(query.toLowerCase())));
    // Update the UI after filtering
    update();
  }
  void forStraineesearch(String query) {
    if (query.isEmpty) {
      // If the query is empty, clear the search list
      SchtraineeSearch.clear();
      return;
    }

    // Perform a case-insensitive search for both name and PNO
    SchtraineeSearch.assignAll(SchoolDataList.where((item) => item.pno!.toLowerCase().contains(query.toLowerCase()) || item.name!.toLowerCase().contains(query.toLowerCase())||item.position!.toLowerCase().contains(query.toLowerCase())));

    update(); // Update the UI after filtering
  }


    @override
    void onInit() {
      getSchoolDetailData(bSchoolId: storage.read('branchId'));
      getTraineeData();
      super.onInit();
    }
  }

