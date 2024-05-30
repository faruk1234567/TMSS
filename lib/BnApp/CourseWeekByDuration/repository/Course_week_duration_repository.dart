import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

import '../model/Course_week_duration_model.dart';

class CourseByWeekDurationDetailsRepo {
  Future<List<CourseWeekDurationModel>> getCourseByWeekDurationDetail(
      int cDurationId) async {
    //var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
            // 'http://114.134.95.235:9999/api/sms/dashboard/get-runningCourseDurationfromprocedure?courseTypeId=3&CurrentDate=$date&CurrentDate=$date&viewStatus=1'),
            'http://123.253.147.242:7775/api/sms/course-week/get-courseWeekByDuration?courseDurationId=${cDurationId}'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<CourseWeekDurationModel> local = [];
        List data = jsonDecode(response.body);
        print(data);
        for (var i in data) {
          local.add(CourseWeekDurationModel.fromJson(i));
        }
        return local;
      } else {
        print(response.statusCode);
        throw "Weekly Course Data List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
