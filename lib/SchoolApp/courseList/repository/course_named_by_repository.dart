import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/coursenamed_by_School_model.dart';








class CourseNamedRepo {
  Future<List<CourseByNamedModel>> getCourseNamedByCourse({String? baseSchoolNameId
  }) async {

    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
            'http://123.253.147.242:7775/api/sms/course-name/get-courseNamesBySchool?baseSchoolNameId=${baseSchoolNameId}'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<CourseByNamedModel> local = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          local.add(CourseByNamedModel.fromJson(i));
        }
        return local;
      } else {
        print(response.statusCode);
        throw "Course List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
