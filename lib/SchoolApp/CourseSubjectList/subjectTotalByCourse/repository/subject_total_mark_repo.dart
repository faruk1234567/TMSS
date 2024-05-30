import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/subjectTotal_model.dart';

class SubjectTotalMarkRepo {
  Future<List<SubjectTotalMarkModel>> getSubjectTotalMark({
    String? baseschoolnameid,
    int? courseNameId,
  }) async {
    final storage = GetStorage();
    try {
      var url =
          'http://123.253.147.242:7775/api/sms/course-name/get-subjectTotalByCourseId?baseSchoolNameId=${baseschoolnameid}&courseNameId=${courseNameId}';

      var response = await http.get(
        Uri.parse(url),

        /*     http://114.134.95.235:9999/api/sms/course-duration/get-courseDurationByCourseTypeFilter?viewStatus=$viewStatus&courseTypeId=$courseTypeId
        http://123.253.147.242:7775/api/sms/bna-subject-name/get-selectedSubjectBySchoolAndCourse?baseSchoolNameId=16&courseNameId=1053*/
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        print("faruk");
        print(json.decode(response.body));
        print(response.statusCode);
        List<SubjectTotalMarkModel> SubjectotalMark = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          SubjectotalMark.add(SubjectTotalMarkModel.fromJson(i));
        }
        return SubjectotalMark;
      } else {
        print(response.statusCode);
        throw "SubjectTotalMark  not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}