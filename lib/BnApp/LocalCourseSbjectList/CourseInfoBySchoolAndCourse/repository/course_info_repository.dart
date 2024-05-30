import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../model/course_info_model.dart';






class CourseInfoRepo {
  Future<List<CourseInfoModel>> getCourseInfoByScAC({int?baseSchoolNameId,int ?courseNameId,int? courseDurationId }) async {

    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse('http://123.253.147.242:7775/api/sms/course-duration/get-courseInfoBySchoolAndCourse?baseSchoolNameId=${baseSchoolNameId}&courseNameId=${courseNameId}&courseDurationId=${courseDurationId}'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<CourseInfoModel> CourseInByScAndCourse = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          CourseInByScAndCourse.add(CourseInfoModel.fromJson(i));
        }
        print(response.statusCode);
        return CourseInByScAndCourse;
      } else {
        print(response.statusCode);
        throw "School with Course Info List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
