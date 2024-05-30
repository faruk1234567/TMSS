import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../model/Exam_status_model.dart';

class ExamStatusRepo {
  Future<List<ExamStatusModel>> getExamStatusList(
      {int? courseDurationId}) async {
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
            'http://123.253.147.242:7775/api/sms/dashboard/get-examStatusBySubjectList?courseDurationId=$courseDurationId'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<ExamStatusModel> ESL = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          ESL.add(ExamStatusModel.fromJson(i));
        }
        print(response.statusCode);
        return ESL;
      } else {
        print(response.statusCode);
        throw "Exam Status List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
