import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../SUCModel/School_upcomming_model.dart';

class SchooUpcommingCourseRepo {
  Future<List<SupcommingModel>> getSchoolUpcommingCourseDataSourse(
      {String? baseSchoolNameId}) async {
    var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse('http://123.253.147.242:7775/api/sms/dashboard/get-upcomingCourseDurationByNbcdSchool?courseTypeId=3&CurrentDate=${date}&baseSchoolNameId=${baseSchoolNameId}'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<SupcommingModel> Upcomming = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          Upcomming.add(SupcommingModel.fromJson(i));
        }
        print(response.statusCode);
        return Upcomming;
      } else {
        print(response.statusCode);
        throw "School Upcomming Course Feature List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
