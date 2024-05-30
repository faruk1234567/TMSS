import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

import '../model/create_trainee_nom_model.dart';



class CreateNomiRepository {
  Future<List<Items>> getTraineeNomineeData(
      {int pageNumber = 1, int?courseDurationId}) async {
    //var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
          // 'http://114.134.95.235:9999/api/sms/dashboard/get-runningCourseDurationfromprocedure?courseTypeId=3&CurrentDate=$date&CurrentDate=$date&viewStatus=1'),
            'http://123.253.147.242:7775/api/sms/trainee-nomination/get-traineeNominationsByCourseDurationId?PageSize=10&PageNumber=${pageNumber}&courseDurationId=${courseDurationId}'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        List<Items> local = [];
        print('faruk');
        var data = jsonDecode(response.body);
        CTraineeNominationModel CtNModel =
        CTraineeNominationModel.fromJson(data);
        for (var i in CtNModel.items!) {
          local.add(i);
        }
        return local;
      } else {
        print(response.statusCode);
        throw "TraineeNomination List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
