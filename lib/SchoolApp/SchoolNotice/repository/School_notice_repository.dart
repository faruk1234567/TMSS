import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/School_notice_model.dart';

class SchoolNoticeRepo {
  Future<List<SchoolNoticeModel>> getSchoolNotice({String? baseSchoolNameId
  }) async {
    var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
            'http://123.253.147.242:7775/api/sms/dashboard/get-noticeBySchoolId?BaseSchoolNameId=${baseSchoolNameId}&CurrentDate=${date}'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<SchoolNoticeModel> local = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          local.add(SchoolNoticeModel.fromJson(i));
        }
        return local;
      } else {
        print(response.statusCode);
        throw "School Notice not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
