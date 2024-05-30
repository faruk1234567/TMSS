import 'dart:convert';


import 'package:get_storage/get_storage.dart';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


import '../model/Foreign_course_model.dart';






/*
class CourseDurationDetailsRepo {
  Future<List<GetCourseDurationDetail>> getCourseDurationDetailList(
      int cDurationId,
      ) async {
    try {
      dio.Response response = await BaseClient.get(url: '${Urls.courseDurationDetails}$cDurationId');
      if (response.statusCode == 200) {
        List<GetCourseDurationDetail> local = [];
        List data = response.data;
        for (var i in data) {
          local.add(GetCourseDurationDetail.fromJson(i));
        }
        return local;



      } else {
        print(response.statusCode);
        throw "Course List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}*/
class ForeignCourseRepo {
  Future<List<RunningForeignCourse>> getForeignCourseDetailList() async {
    var date = DateFormat('MM/dd/yyyy').format(DateTime.now());
    final storage = GetStorage();
    try {
      var response = await http.get(
        Uri.parse(
          // 'http://114.134.95.235:9999/api/sms/dashboard/get-runningCourseDurationfromprocedure?courseTypeId=3&CurrentDate=$date&CurrentDate=$date&viewStatus=1'),
            'http://123.253.147.242:7775/api/sms/dashboard/get-runningForeignCourseDurationfromprocedure?courseTypeId=18&CurrentDate=$date'),
        //http://123.253.147.242:7775/api/sms/dashboard/get-runningCourseDurationfromprocedure?courseTypeId=3&CurrentDate=$date&CurrentDate=$date'
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'Authorization': 'Bearer ${storage.read("token")}',
        },
      );
      if (response.statusCode == 200) {
        List<RunningForeignCourse> local = [];
        List data = jsonDecode(response.body);
        for (var i in data) {
          local.add(RunningForeignCourse.fromJson(i));
        }
        return local;
      } else {
        print(response.statusCode);
        throw "CourseDurationList List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
/*class CourseDurationDetailsRepo {

  Future <List<GetCourseDurationDetailList>> getCourseDurationDetailList(int cDurationId) async{

    try {

      var response= await http.get(Uri.parse('http://114.134.95.235:9999/api/sms/bna-subject-name/get-subjectInstructorListByCourseDuration?courseDurationId=$cDurationId'));
      //dio.Response response= await BaseClient.get(url: Urls.organizationsList);
      var decodeProducts=json.decode(response.body);
      List<GetCourseDurationDetailList> organizationList = await decodeProducts.map<GetCourseDurationDetailList>
        ((json)=>GetCourseDurationDetailList.fromJson(json)).toList();
      return organizationList;

      *//*if(response.statusCode==200){
        //var decodeOrganization=json.decode(response.)
        OrganizationModel organizationModel=OrganizationModel.fromJson(response.data);
        List<OrganizationModel> orgalist=organizationModel.f
         return organizationModel;




      }else{
        Get.snackbar('Fail', 'Data Upload Fail');
        throw Exception();
      }*//*

    }catch(e){
      print(e);
      rethrow;
    }

  }
}*/
