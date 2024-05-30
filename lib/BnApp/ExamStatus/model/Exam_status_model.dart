// To parse this JSON data, do
//
//     final examStatusModel = examStatusModelFromJson(jsonString);

import 'dart:convert';

List<ExamStatusModel> examStatusModelFromJson(String str) => List<ExamStatusModel>.from(json.decode(str).map((x) => ExamStatusModel.fromJson(x)));

String examStatusModelToJson(List<ExamStatusModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamStatusModel {
  String ?subjectName;
  String ?shortName;
  dynamic? moduleName;
  int ?courseDurationId;
  int? coursetypeid;
  Course? course;
  String ?pno;
  String? position;
  String ?name;
  dynamic attendanceComplete;
  dynamic examMarkComplete;
  dynamic resultSubmissionStatus;
  dynamic finalApproveStatus;

  ExamStatusModel({
    this.subjectName,
    this.shortName,
    this.moduleName,
    this.courseDurationId,
    this.coursetypeid,
    this.course,
    this.pno,
    this.position,
    this.name,
    this.attendanceComplete,
    this.examMarkComplete,
    this.resultSubmissionStatus,
    this.finalApproveStatus,
  });

  factory ExamStatusModel.fromJson(Map<String, dynamic> json) => ExamStatusModel(
    subjectName: json["subjectName"],
    shortName: json["shortName"],
    moduleName: json["moduleName"],
    courseDurationId: json["courseDurationId"],
    coursetypeid: json["coursetypeid"],
    course: courseValues.map[json["course"]],
    pno: json["pno"],
    position: json["position"],
    name: json["name"],
    attendanceComplete: json["attendanceComplete"],
    examMarkComplete: json["examMarkComplete"],
    resultSubmissionStatus: json["resultSubmissionStatus"],
    finalApproveStatus: json["finalApproveStatus"],
  );

  Map<String, dynamic> toJson() => {
    "subjectName": subjectName,
    "shortName": shortName,
    "moduleName": moduleNameValues.reverse[moduleName],
    "courseDurationId": courseDurationId,
    "coursetypeid": coursetypeid,
    "course": courseValues.reverse[course],
    "pno": pno,
    "position": position,
    "name": name,
    "attendanceComplete": attendanceComplete,
    "examMarkComplete": examMarkComplete,
    "resultSubmissionStatus": resultSubmissionStatus,
    "finalApproveStatus": finalApproveStatus,
  };
}

enum Course {
  PRE_COMMISSION_TRG
}

final courseValues = EnumValues({
  "Pre-Commission Trg": Course.PRE_COMMISSION_TRG
});

enum ModuleName {
  SEMESTER_V,
  SEMESTER_VI
}

final moduleNameValues = EnumValues({
  "Semester - V": ModuleName.SEMESTER_V,
  "Semester - VI": ModuleName.SEMESTER_VI
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
