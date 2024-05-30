import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../model/instructor_list_model.dart';





class instructorRepo{
  Future<List<InstructorModel>> getInstructorList({int?baseSchoolNameId,int?courseNameId,int?courseDurationId}) async {
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
            'http://123.253.147.242:7775/api/sms/course-instructor/get-instructorListByCourse?baseSchoolNameId=$baseSchoolNameId&courseNameId=$courseNameId&courseDurationId=$courseDurationId'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        print('faruk');
        print (response.statusCode);
        List<InstructorModel> inm = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          inm.add(InstructorModel.fromJson(i));
        }
        print(response.statusCode);
        return inm;
      } else {
        print(response.statusCode);
        throw "instructor List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
