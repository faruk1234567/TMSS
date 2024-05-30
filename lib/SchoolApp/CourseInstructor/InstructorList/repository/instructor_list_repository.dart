import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/instructor_list_model.dart';

class SchoolCourrseInstructorListRepo {
  Future<List<CourseInstructorListModel>> getSchoolCourseByInstructor(
      {String? baseschoolnameid,
      int? courseNameId,
      int? courseDurationId}) async {
    final storage = GetStorage();
    try {
      var url =
          'http://123.253.147.242:7775/api/sms/dashboard/get-instructorDetailByCourse?baseSchoolNameId=${baseschoolnameid}&courseNameId=${courseNameId}&courseDurationId=${courseDurationId}';

      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        print("faruk");
        print(json.decode(response.body));
        print(response.statusCode);
        List<CourseInstructorListModel> InstructorList = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          InstructorList.add(CourseInstructorListModel.fromJson(i));
        }
        return InstructorList;
      } else {
        print(response.statusCode);
        throw "Instructor Data  not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
