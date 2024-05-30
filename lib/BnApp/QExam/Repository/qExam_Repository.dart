import 'dart:convert';


import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/qExam_model.dart';












class qExamServiseRepo {
  Future<List<QExam>> getQexamSerViseCourse() async {

    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(

            'http://123.253.147.242:7775/api/sms/dashboard/get-runningCourseDurationForCentralExamList?courseNameId=1252'),

        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<QExam> qExam = [];
        List qdata = jsonDecode(response.body);
        for (var i in qdata) {
          qExam.add(QExam.fromJson(i));
        }
        return qExam;
      } else {
        print(response.statusCode);
        throw "Qexam List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}




