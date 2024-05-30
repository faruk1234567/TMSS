import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../Model/officer_model.dart';





class RunningOficerRepo {
  Future<List<OfficerModel>> getRunningOfficerList() async {
    var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse('http://123.253.147.242:7775/api/sms/dashboard/get-runningCourseTotalOfficerListfromprocedure?TraineeStatusId=4&CurrentDate=$date'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<OfficerModel> ToOfficer = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          ToOfficer.add(OfficerModel.fromJson(i));
        }
        print(response.statusCode);
        print(response.body);
        return ToOfficer;
      } else {
        print(response.statusCode);
        throw "Officer  List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
