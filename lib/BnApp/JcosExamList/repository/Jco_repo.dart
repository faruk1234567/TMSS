import 'dart:convert';


import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/Jco_model.dart';












class JcoServiseRepo {
  Future<List<JcoExam>> JcoCourse() async {

    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(

            'http://123.253.147.242:7775/api/sms/dashboard/get-centralCourseDurationByTypeAndName?courseTypeId=1021&courseNameId=1253'),

        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<JcoExam> Jco = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          Jco.add(JcoExam.fromJson(i));
        }
        return Jco;
      } else {
        print(response.statusCode);
        throw "Jco List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}




