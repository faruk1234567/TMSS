// To parse this JSON data, do
//
//     final qExam = qExamFromJson(jsonString);

import 'dart:convert';

List<QExam> qExamFromJson(String str) => List<QExam>.from(json.decode(str).map((x) => QExam.fromJson(x)));

String qExamToJson(List<QExam> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QExam {
  String ?course;
  DateTime? durationFrom;
  DateTime? durationTo;
  String? courseTitle;
  int ?courseNameId;
  int ?courseDurationId;
  String? remark;
  int ?candidates;

  QExam({
    this.course,
    this.durationFrom,
    this.durationTo,
    this.courseTitle,
    this.courseNameId,
    this.courseDurationId,
    this.remark,
    this.candidates,
  });

  factory QExam.fromJson(Map<String, dynamic> json) => QExam(
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
