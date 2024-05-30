import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

import '../model/reading_material_upload_model.dart';



class SchoolReadingMaterialRepo {
  Future<List<Item>> getSchoolRMaterialData(
      {int pageNumber = 1, String? baseSchoolNameId}) async {
    //var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
          // 'http://114.134.95.235:9999/api/sms/dashboard/get-runningCourseDurationfromprocedure?courseTypeId=3&CurrentDate=$date&CurrentDate=$date&viewStatus=1'),
            'http://123.253.147.242:7775/api/sms/reading-material/get-readingMaterials?PageSize=10&PageNumber=${pageNumber}&baseSchoolNameId=${baseSchoolNameId}'),
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
        List<Item> local = [];
        print('faruk');
        var data = jsonDecode(response.body);
        ReadinMuModel schoolReadMaterialModel =
        ReadinMuModel.fromJson(data);
        for (var i in schoolReadMaterialModel.items!) {
          local.add(i);
        }
        return local;
      } else {
        print(response.statusCode);
        throw "School Reading Material  List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}