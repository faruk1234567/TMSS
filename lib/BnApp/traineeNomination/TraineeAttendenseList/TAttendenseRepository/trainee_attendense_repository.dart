import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

import '../TAttendenseModel/t_attendense_model.dart';







class TraineeAttendenseRepo {
  Future<List<TraineeAttendenseModel>> traineeAttenCall({int? traineeId,int? courseSectionId,
    int? courseDurationId} ) async {
    final storage = GetStorage();
    try {
      var url='http://123.253.147.242:7775/api/sms/dashboard/get-traineeAttendanceList?traineeId=${traineeId}&courseDurationId=${courseDurationId}&courseSectionId=${courseSectionId}&attendanceStatus=100';

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
        List<TraineeAttendenseModel> TaModel = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          TaModel.add(TraineeAttendenseModel.fromJson(i));
        }
        return TaModel;
      } else {
        print(response.statusCode);
        throw "TraineeAttendense Model  not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
