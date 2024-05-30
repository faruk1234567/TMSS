import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/Budget_model.dart';



class BudgetRepo {
  Future<List<Budget>> getBudget() async {
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
            'http://123.253.147.242:7775/api/sms/budget-code/get-budgetCodesRequest'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<Budget> BudgetInfo = [];
        List Budgetdata = jsonDecode(response.body);
        for (var i in Budgetdata) {
          BudgetInfo.add(Budget.fromJson(i));
        }
        return BudgetInfo;
      } else {
        print(response.statusCode);
        throw "BudgetInfo  not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
