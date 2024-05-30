// To parse this JSON data, do
//
//     final schoolExamModel = schoolExamModelFromJson(jsonString);

import 'dart:convert';

List<SchoolExamModel> schoolExamModelFromJson(String str) => List<SchoolExamModel>.from(json.decode(str).map((x) => SchoolExamModel.fromJson(x)));

String schoolExamModelToJson(List<SchoolExamModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolExamModel {
  int? baseschoolnameid;
  int? classRoutineId;
  DateTime? date;
  int ?coursemoduleid;
  int? attendanceComplete;
  String? course;
  int ?courseNameId;
  String? courseTitle;
  int? courseDurationId;
  int? bnaSubjectNameId;
  String? subjectName;
  String ?shortName;
  int? courseSectionId;
  int? resultSubmissionStatus;
  int? subjectMarkId;
  int? markTypeId;

  SchoolExamModel({
    this.baseschoolnameid,
    this.classRoutineId,
    this.date,
    this.coursemoduleid,
    this.attendanceComplete,
    this.course,
    this.courseNameId,
    this.courseTitle,
    this.courseDurationId,
    this.bnaSubjectNameId,
    this.subjectName,
    this.shortName,
    this.courseSectionId,
    this.resultSubmissionStatus,
    this.subjectMarkId,
    this.markTypeId,
  });

  factory SchoolExamModel.fromJson(Map<String, dynamic> json) => SchoolExamModel(
    baseschoolnameid: json["baseschoolnameid"],
    classRoutineId: json["classRoutineId"],
    date: DateTime.parse(json["date"]),
    coursemoduleid: json["coursemoduleid"],
    attendanceComplete: json["attendanceComplete"],
    course: json["course"],
    courseNameId: json["courseNameId"],
    courseTitle: json["courseTitle"],
    courseDurationId: json["courseDurationId"],
    bnaSubjectNameId: json["bnaSubjectNameId"],
    subjectName: json["subjectName"],
    shortName: json["shortName"],
    courseSectionId: json["courseSectionId"],
    resultSubmissionStatus: json["resultSubmissionStatus"],
    subjectMarkId: json["subjectMarkId"],
    markTypeId: json["markTypeId"],
  );

  Map<String, dynamic> toJson() => {
    "baseschoolnameid": baseschoolnameid,
    "classRoutineId": classRoutineId,
    "date": date?.toIso8601String(),
    "coursemoduleid": coursemoduleid,
    "attendanceComplete": attendanceComplete,
    "course": course,
    "courseNameId": courseNameId,
    "courseTitle": courseTitle,
    "courseDurationId": courseDurationId,
    "bnaSubjectNameId": bnaSubjectNameId,
    "subjectName": subjectName,
    "shortName": shortName,
    "courseSectionId": courseSectionId,
    "resultSubmissionStatus": resultSubmissionStatus,
    "subjectMarkId": subjectMarkId,
    "markTypeId": markTypeId,
  };
}

enum Course {
  NBCD_COURSE_II,
  NBCD_COURSE_III_1_ST_RATE_SAILOR_LEADING_RATES
}

final courseValues = EnumValues({
  "NBCD Course - II": Course.NBCD_COURSE_II,
  "NBCD Course - III ( 1st Rate Sailor) Leading Rates": Course.NBCD_COURSE_III_1_ST_RATE_SAILOR_LEADING_RATES
});

enum ShortName {
  P,
  W
}

final shortNameValues = EnumValues({
  "P": ShortName.P,
  "W": ShortName.W
});

enum SubjectName {
  PRACTICAL_DC_FF,
  WRITTEN_NBCD_THEORY
}

final subjectNameValues = EnumValues({
  "Practical DC & FF": SubjectName.PRACTICAL_DC_FF,
  "Written (NBCD Theory)": SubjectName.WRITTEN_NBCD_THEORY
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
