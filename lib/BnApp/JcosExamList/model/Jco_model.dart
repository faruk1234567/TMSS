// To parse this JSON data, do
//
//     final jcoExam = jcoExamFromJson(jsonString);

import 'dart:convert';

List<JcoExam> jcoExamFromJson(String str) => List<JcoExam>.from(json.decode(str).map((x) => JcoExam.fromJson(x)));

String jcoExamToJson(List<JcoExam> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JcoExam {
  String ?course;
  DateTime? durationFrom;
  DateTime? durationTo;
  String ?courseTitle;
  dynamic baseSchoolNameId;
  int? courseNameId;
  int? courseDurationId;
  dynamic noOfCandidates;
  dynamic professional;
  dynamic nbcd;
  String ?remark;
  int ?candidates;

  JcoExam({
    this.course,
    this.durationFrom,
    this.durationTo,
    this.courseTitle,
    this.baseSchoolNameId,
    this.courseNameId,
    this.courseDurationId,
    this.noOfCandidates,
    this.professional,
    this.nbcd,
    this.remark,
    this.candidates,
  });

  factory JcoExam.fromJson(Map<String, dynamic> json) => JcoExam(
    course: json["course"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
    courseTitle: json["courseTitle"],
    baseSchoolNameId: json["baseSchoolNameId"],
    courseNameId: json["courseNameId"],
    courseDurationId: json["courseDurationId"],
    noOfCandidates: json["noOfCandidates"],
    professional: json["professional"],
    nbcd: json["nbcd"],
    remark: json["remark"],
    candidates: json["candidates"],
  );

  Map<String, dynamic> toJson() => {
    "course": course,
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
    "courseTitle": courseTitle,
    "baseSchoolNameId": baseSchoolNameId,
    "courseNameId": courseNameId,
    "courseDurationId": courseDurationId,
    "noOfCandidates": noOfCandidates,
    "professional": professional,
    "nbcd": nbcd,
    "remark": remark,
    "candidates": candidates,
  };
}
