import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../model/total_trainee_model.dart';
HttpWithMiddleware https = HttpWithMiddleware.build(requestTimeout: Duration(seconds: 30), middlewares: [
  HttpLogger(logLevel: LogLevel.BODY),
]);




class TotalTraineeRepo {
  Future<List<TotalTraineeModel>> getTotalTraineeList() async {
    var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse('http://123.253.147.242:7775/api/sms/dashboard/get-nominatedCourseListFromSpRequest?CurrentDate=$date'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<TotalTraineeModel> ToTrainee = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          ToTrainee.add(TotalTraineeModel.fromJson(i));
        }
        print(response.statusCode);
        print(response.body);
        return ToTrainee;
      } else {
        print(response.statusCode);
        throw "Trainee  List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
