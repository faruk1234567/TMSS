import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../model/bna_subjectName_By-Course_moel.dart';






class BnaSubjectListRepo {
  Future<List<BnaSubjectNameModel>> getBnaSubjectList() async {

    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse('http://123.253.147.242:7775/api/sms/bna-subject-name/get-bnaSubjectNameListByCourseNameId'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<BnaSubjectNameModel> localsublist = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          localsublist.add(BnaSubjectNameModel.fromJson(i));
        }
        print(response.statusCode);
        return localsublist;
      } else {
        print(response.statusCode);
        throw "Bna Subject List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
