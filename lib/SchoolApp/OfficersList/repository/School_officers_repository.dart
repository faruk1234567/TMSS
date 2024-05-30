import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../model/officers_list_model.dart';







class SchoolOfficersTraineeRepo {
  Future<List<SchoolOfficersModel>> getSchoolOfficersTrainee({String? baseSchoolNameId
  } ) async {
    var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var url='http://123.253.147.242:7775/api/sms/dashboard/get-runningCourseTotalOfficerListBySchool?TraineeStatusId=4&CurrentDate=${date}&baseSchoolNameId=${baseSchoolNameId}';
      //var url='http://123.253.147.242:7775/api/sms/dashboard/get-nominatedCourseListFromSpRequestBySchoolId?CurrentDate=${date}&baseSchoolNameId=${baseSchoolNameId}';

      var response = await http.get(
        Uri.parse(
            url),
        /*     http://114.134.95.235:9999/api/sms/course-duration/get-courseDurationByCourseTypeFilter?viewStatus=$viewStatus&courseTypeId=$courseTypeId
        http://123.253.147.242:7775/api/sms/bna-subject-name/get-selectedSubjectBySchoolAndCourse?baseSchoolNameId=16&courseNameId=1053*/
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        print (response.statusCode);
        List<SchoolOfficersModel> SOfficesrList = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          SOfficesrList.add(SchoolOfficersModel.fromJson(i));
        }
        return SOfficesrList;
      } else {
        print(response.statusCode);
        throw "Officers Data Not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}