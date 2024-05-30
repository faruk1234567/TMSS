import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../model/sailors_model.dart';

class RunningSailorsRepo {
  Future<List<SailorsModel>> getRunningSailorsList() async {
    var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
            'http://123.253.147.242:7775/api/sms/dashboard/get-runningCourseTotalOfficerListfromprocedure?TraineeStatusId=5&CurrentDate=$date'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<SailorsModel> ToSailor = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          ToSailor.add(SailorsModel.fromJson(i));
        }
        print(response.statusCode);
        print(response.body);
        return ToSailor;
      } else {
        print(response.statusCode);
        throw "Sailors  List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
