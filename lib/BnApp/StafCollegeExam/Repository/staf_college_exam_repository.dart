import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/Staf_college_exam_model.dart';

class StafCollegeExamRepo {
  Future<List<StafCollegeExam>> getStaffCollegeExamData() async {
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
            'http://123.253.147.242:7775/api/sms/dashboard/get-runningCourseDurationForCentralExamList?courseNameId=1251'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<StafCollegeExam> StafColllegeExam = [];
        List sCexdata = jsonDecode(response.body);
        for (var i in sCexdata) {
          StafColllegeExam.add(StafCollegeExam.fromJson(i));
        }
        return StafColllegeExam;
      } else {
        print(response.statusCode);
        throw "StafColllegeExam List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
