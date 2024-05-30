import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../model/Get_course_country_bySchool_model.dart';

class CountryBySchoolRepo{
  Future<List<GetCourseCountryBySchool>> getCourseCountryBySchool() async {
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
            'http://123.253.147.242:7775/api/sms/dashboard/get-spGetCourseCountBySchool'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<GetCourseCountryBySchool> local = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          local.add(GetCourseCountryBySchool.fromJson(i));
        }
        print(response.statusCode);
        return local;
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
