import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../model/local_course_subject_list_model.dart';




class LcourseSListRepo {
  Future<List<LocalCourseSubListModel>> getLocalCourseSubjectList({int?baseSchoolNameId,int ?courseNameId }) async {

    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse('http://123.253.147.242:7775/api/sms/bna-subject-name/get-selectedSubjectBySchoolAndCourse?baseSchoolNameId=$baseSchoolNameId&courseNameId=$courseNameId'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<LocalCourseSubListModel> localsublist = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          localsublist.add(LocalCourseSubListModel.fromJson(i));
        }
        print(response.statusCode);
        return localsublist;
      } else {
        print(response.statusCode);
        throw "Local Course Subject List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
