// To parse this JSON data, do
//
//     final sLoalourseModel = sLoalourseModelFromJson(jsonString);

import 'dart:convert';

List<SLoalourseModel> sLoalourseModelFromJson(String str) => List<SLoalourseModel>.from(json.decode(str).map((x) => SLoalourseModel.fromJson(x)));

String sLoalourseModelToJson(List<SLoalourseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SLoalourseModel {
  String? schoolName;
  String ?course;
  dynamic nbcdStatus;
  String ?courseSyllabus;
  String ?courseTitle;
  DateTime? durationFrom;
  DateTime ?durationTo;
  dynamic? baseSchoolNameId;
  int ?courseNameId;
  int? courseDurationId;
  String ?noOfCandidates;
  String ?professional;
  String ?nbcd;
  String? remark;
  int ?completeWeek;
  int ?countWeek;

  SLoalourseModel({
    this.schoolName,
    this.course,
    this.nbcdStatus,
    this.courseSyllabus,
    this.courseTitle,
    this.durationFrom,
    this.durationTo,
    this.baseSchoolNameId,
    this.courseNameId,
    this.courseDurationId,
    this.noOfCandidates,
    this.professional,
    this.nbcd,
    this.remark,
    this.completeWeek,
    this.countWeek,
  });

  factory SLoalourseModel.fromJson(Map<String, dynamic> json) => SLoalourseModel(
    schoolName: json["schoolName"],
    course: json["course"],
    nbcdStatus: json["nbcdStatus"],
    courseSyllabus: json["courseSyllabus"],
    courseTitle: json["courseTitle"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
    baseSchoolNameId: json["baseSchoolNameId"],
    courseNameId: json["courseNameId"],
    courseDurationId: json["courseDurationId"],
    noOfCandidates: json["noOfCandidates"],
    professional: json["professional"],
    nbcd: json["nbcd"],
    remark: json["remark"],
    completeWeek: json["completeWeek"],
    countWeek: json["countWeek"],
  );

  Map<String, dynamic> toJson() => {
    "schoolName": schoolName,
    "course": course,
    "nbcdStatus": nbcdStatus,
    "courseSyllabus": courseSyllabus,
    "courseTitle": courseTitle,
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
    "baseSchoolNameId": baseSchoolNameId,
    "courseNameId": courseNameId,
    "courseDurationId": courseDurationId,
    "noOfCandidates": noOfCandidates,
    "professional": professional,
    "nbcd": nbcd,
    "remark": remark,
    "completeWeek": completeWeek,
    "countWeek": countWeek,
  };
}
