// To parse this JSON data, do
//
//     final getCourseCountryBySchool = getCourseCountryBySchoolFromJson(jsonString);

import 'dart:convert';

List<GetCourseCountryBySchool> getCourseCountryBySchoolFromJson(String str) => List<GetCourseCountryBySchool>.from(json.decode(str).map((x) => GetCourseCountryBySchool.fromJson(x)));

String getCourseCountryBySchoolToJson(List<GetCourseCountryBySchool> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCourseCountryBySchool {
  int ?baseSchoolNameId;
  String? schoolName;
  int ?column1;
  String? baseName;
  int? courseCount;
  int? traineeCount;
  int ?officerCount;
  int? saylorCount;
  int? civilCount;
  int? foreignCount;
  int? cadetCount;
  int ?midCount;

  GetCourseCountryBySchool({
    this.baseSchoolNameId,
    this.schoolName,
    this.column1,
    this.baseName,
    this.courseCount,
    this.traineeCount,
    this.officerCount,
    this.saylorCount,
    this.civilCount,
    this.foreignCount,
    this.cadetCount,
    this.midCount,
  });

  factory GetCourseCountryBySchool.fromJson(Map<String, dynamic> json) => GetCourseCountryBySchool(
    baseSchoolNameId: json["baseSchoolNameId"],
    schoolName: json["schoolName"],
    column1: json["column1"],
    baseName: json["baseName"],
    courseCount: json["courseCount"],
    traineeCount: json["traineeCount"],
    officerCount: json["officerCount"],
    saylorCount: json["saylorCount"],
    civilCount: json["civilCount"],
    foreignCount: json["foreignCount"],
    cadetCount: json["cadetCount"],
    midCount: json["midCount"],
  );

  Map<String, dynamic> toJson() => {
    "baseSchoolNameId": baseSchoolNameId,
    "schoolName": schoolName,
    "column1": column1,
    "baseName": baseName,
    "courseCount": courseCount,
    "traineeCount": traineeCount,
    "officerCount": officerCount,
    "saylorCount": saylorCount,
    "civilCount": civilCount,
    "foreignCount": foreignCount,
    "cadetCount": cadetCount,
    "midCount": midCount,
  };
}
