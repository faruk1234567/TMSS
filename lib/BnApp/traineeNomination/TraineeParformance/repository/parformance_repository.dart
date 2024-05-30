import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;




import '../model/parformance_model.dart';



class ParformanceRepo {
  Future<List<ParformanceList>> ParformanceApiCall({int? baseSchoolNameId,int? courseDurationId,
    int? traineeId} ) async {
    final storage = GetStorage();
    try {
      var url='http://123.253.147.242:7775/api/sms/bna-exam-mark/get-traineePerformanceDetailsByParameters?courseDurationId=$courseDurationId&baseSchoolNameId=$baseSchoolNameId&traineeId=$traineeId';

      var response = await http.get(
        Uri.parse(
            url),
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
        print(json.decode(response.body));
        print (response.statusCode);
        List<ParformanceList> perList = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          perList.add(ParformanceList.fromJson(i));
        }
        return perList;
      } else {
        print(response.statusCode);
        throw "PerformanceList  not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
