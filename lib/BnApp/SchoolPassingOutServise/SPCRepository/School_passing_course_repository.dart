import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../SPCModel/School_passing_course_model.dart';






class SchoolPassingCourseRepo {
  Future<List<SPassingourseModel>> getSchoolPassingCourseDataSource({String ?baseSchoolNameId}) async {
    var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse('http://123.253.147.242:7775/api/sms/dashboard/get-runningCourseDurationBySchool?courseTypeId=3&CurrentDate=$date&CurrentDate=$date&baseSchoolNameId=${baseSchoolNameId}&viewStatus=2'),

        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<SPassingourseModel> local = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          local.add(SPassingourseModel.fromJson(i));
        }
        print(response.statusCode);
        return local;
      } else {
        print(response.statusCode);
        throw "School Passing Course Feature List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
