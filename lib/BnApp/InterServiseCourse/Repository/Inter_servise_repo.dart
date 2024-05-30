import 'dart:convert';


import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/inter_Servise_model.dart';










class InterServiseRepo {
  Future<List<InterServiseCourse>> getInterSerViseCourse() async {
    var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(

            'http://123.253.147.242:7775/api/sms/dashboard/get-runningForeignCourseDurationfromprocedure?courseTypeId=19&CurrentDate=$date'),

        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<InterServiseCourse> local = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          local.add(InterServiseCourse.fromJson(i));
        }
        return local;
      } else {
        print(response.statusCode);
        throw "InterServise List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}




