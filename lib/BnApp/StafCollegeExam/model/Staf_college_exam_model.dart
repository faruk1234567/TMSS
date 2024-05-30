// To parse this JSON data, do
//
//     final stafCollegeExam = stafCollegeExamFromJson(jsonString);

import 'dart:convert';

List<StafCollegeExam> stafCollegeExamFromJson(String str) => List<StafCollegeExam>.from(json.decode(str).map((x) => StafCollegeExam.fromJson(x)));

String stafCollegeExamToJson(List<StafCollegeExam> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StafCollegeExam {
  String ?course;
  DateTime ?durationFrom;
  DateTime ?durationTo;
  String ?courseTitle;
  int ?courseNameId;
  int ?courseDurationId;
  String ?remark;
  int? candidates;

  StafCollegeExam({
    this.course,
    this.durationFrom,
    this.durationTo,
    this.courseTitle,
    this.courseNameId,
    this.courseDurationId,
    this.remark,
    this.candidates,
  });

  factory StafCollegeExam.fromJson(Map<String, dynamic> json) => StafCollegeExam(
    course: json["course"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
    courseTitle: json["courseTitle"],
    courseNameId: json["courseNameId"],
    courseDurationId: json["courseDurationId"],
    remark: json["remark"],
    candidates: json["candidates"],
  );

  Map<String, dynamic> toJson() => {
    "course": course,
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
    "courseTitle": courseTitle,
    "courseNameId": courseNameId,
    "courseDurationId": courseDurationId,
    "remark": remark,
    "candidates": candidates,
  };
}
