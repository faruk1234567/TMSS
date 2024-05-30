// To parse this JSON data, do
//
//     final localModel = localModelFromJson(jsonString);

import 'dart:convert';

List<LocalModel> localModelFromJson(String str) =>
    List<LocalModel>.from(json.decode(str).map((x) => LocalModel.fromJson(x)));

String localModelToJson(List<LocalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocalModel {
  String? schoolName;
  String? course;
  String? courseSyllabus;
  DateTime? durationFrom;
  DateTime? durationTo;
  dynamic foreignCourseGoInfoId;
  dynamic fileUpload;
  String? countryName;
  int? baseSchoolNameId;
  String? courseTitle;
  int? courseNameId;
  int? courseDurationId;
  String? noOfCandidates;
  String? professional;
  String? nbcd;
  String? remark;
  dynamic orgName;
  int? candidates;
  int? submittedReport;
  dynamic sanctionAmount;
  int? countWeek;
  int? completeWeek;

  LocalModel({
    this.schoolName,
    this.course,
    this.courseSyllabus,
    this.durationFrom,
    this.durationTo,
    this.foreignCourseGoInfoId,
    this.fileUpload,
    this.countryName,
    this.baseSchoolNameId,
    this.courseTitle,
    this.courseNameId,
    this.courseDurationId,
    this.noOfCandidates,
    this.professional,
    this.nbcd,
    this.remark,
    this.orgName,
    this.candidates,
    this.submittedReport,
    this.sanctionAmount,
    this.countWeek,
    this.completeWeek,
  });

  factory LocalModel.fromJson(Map<String, dynamic> json) => LocalModel(
    schoolName: json["schoolName"],
    course: json["course"],
    courseSyllabus: json["courseSyllabus"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
    foreignCourseGoInfoId: json["foreignCourseGOInfoId"],
    fileUpload: json["fileUpload"],
    countryName: json["countryName"],
    baseSchoolNameId: json["baseSchoolNameId"],
    courseTitle: json["courseTitle"],
    courseNameId: json["courseNameId"],
    courseDurationId: json["courseDurationId"],
    noOfCandidates: json["noOfCandidates"],
    professional: json["professional"],
    nbcd: json["nbcd"],
    remark: json["remark"],
    orgName: json["orgName"],
    candidates: json["candidates"],
    submittedReport: json["submittedReport"],
    sanctionAmount: json["sanctionAmount"],
    countWeek: json["countWeek"],
    completeWeek: json["completeWeek"],
  );

  Map<String, dynamic> toJson() => {
    "schoolName": schoolName,
    "course": course,
    "courseSyllabus": courseSyllabus,
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
    "foreignCourseGOInfoId": foreignCourseGoInfoId,
    "fileUpload": fileUpload,
    "countryName": countryName,
    "baseSchoolNameId": baseSchoolNameId,
    "courseTitle": courseTitle,
    "courseNameId": courseNameId,
    "courseDurationId": courseDurationId,
    "noOfCandidates": noOfCandidates,
    "professional": professional,
    "nbcd": nbcd,
    "remark": remark,
    "orgName": orgName,
    "candidates": candidates,
    "submittedReport": submittedReport,
    "sanctionAmount": sanctionAmount,
    "countWeek": countWeek,
    "completeWeek": completeWeek,
  };
}
