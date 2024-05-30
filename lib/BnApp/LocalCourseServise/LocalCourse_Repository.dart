import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'LocalCourse_model.dart';


class LocalCourseRepo {
  Future<List<LocalModel>> getLocalCourseDataSourse() async {
    var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse('http://123.253.147.242:7775/api/sms/dashboard/get-runningCourseDurationfromprocedure?courseTypeId=3&CurrentDate=$date&CurrentDate=$date&viewStatus=1'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<LocalModel> local = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          local.add(LocalModel.fromJson(i));
        }
        print(response.statusCode);
        return local;
      } else {
        print(response.statusCode);
        throw "Feature List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
