
import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


import '../model/foreign_trainee_model.dart';





class ForeignTraineeRepo {
  Future<List<ForeignTraineeModel>> getForeignTrainingList() async {
    var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse('http://123.253.147.242:7775/api/sms/dashboard/get-nominatedTraineeByTypeAndBase?CurrentDate=$date&baseNameId=0&officerTypeId=2'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<ForeignTraineeModel> ForeignOfficer = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          ForeignOfficer.add(ForeignTraineeModel.fromJson(i));
        }
        print(response.statusCode);
        print(response.body);
        return ForeignOfficer;
      } else {
        print(response.statusCode);
        throw "Foreign Trainee  List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
