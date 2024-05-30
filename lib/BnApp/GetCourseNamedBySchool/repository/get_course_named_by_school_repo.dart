import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../model/get_course_named_by_school_model.dart';



class NamedBySchoolRepo{
  Future<List<GetCourseNamedBySchool>> getCourseNamedBySchool() async {
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
            'http://123.253.147.242:7775/api/sms/course-name/get-courseNamesBySchool?baseSchoolNameId=0'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<GetCourseNamedBySchool> NbSchool = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          NbSchool.add(GetCourseNamedBySchool.fromJson(i));
        }
        print(response.statusCode);
        return NbSchool;
      } else {
        print(response.statusCode);
        throw "School List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
