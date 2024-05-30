import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/Precourse_material_list.dart';










class PreCourseMaterialRepo {
  Future<List<PreCourseMaterialModel>> getPreCourseMaterial({String? baseSchoolNameId
  }) async {

    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
            'http://123.253.147.242:7775/api/sms/dashboard/get-readingMaterialBySchool?baseSchoolNameId=${baseSchoolNameId}'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<PreCourseMaterialModel> local = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          local.add(PreCourseMaterialModel.fromJson(i));
        }
        return local;
      } else {
        print(response.statusCode);
        throw "PreCourse Material List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
