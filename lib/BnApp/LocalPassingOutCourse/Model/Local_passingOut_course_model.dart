// To parse this JSON data, do
//
//     final localPassingModel = localPassingModelFromJson(jsonString);

import 'dart:convert';

List<LocalPassingModel> localPassingModelFromJson(String str) => List<LocalPassingModel>.from(json.decode(str).map((x) => LocalPassingModel.fromJson(x)));

String localPassingModelToJson(List<LocalPassingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocalPassingModel {
  String? schoolName;
  String? course;
  String ?courseSyllabus;
  DateTime? durationFrom;
  DateTime? durationTo;
  dynamic foreignCourseGoInfoId;
  dynamic fileUpload;
  CountryName? countryName;
  int? baseSchoolNameId;
  String? courseTitle;
  int? courseNameId;
  int? courseDurationId;
  String? noOfCandidates;
  String? professional;
  String? nbcd;
  Remark? remark;
  dynamic orgName;
  int? candidates;
  int? submittedReport;
  dynamic sanctionAmount;
  int? countWeek;
  int? completeWeek;

  LocalPassingModel({
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

  factory LocalPassingModel.fromJson(Map<String, dynamic> json) => LocalPassingModel(
    schoolName: json["schoolName"],
    course: json["course"],
    courseSyllabus: json["courseSyllabus"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
    foreignCourseGoInfoId: json["foreignCourseGOInfoId"],
    fileUpload: json["fileUpload"],
    countryName: countryNameValues.map[json["countryName"]],
    baseSchoolNameId: json["baseSchoolNameId"],
    courseTitle: json["courseTitle"],
    courseNameId: json["courseNameId"],
    courseDurationId: json["courseDurationId"],
    noOfCandidates: json["noOfCandidates"],
    professional: json["professional"],
    nbcd: json["nbcd"],
    remark: remarkValues.map[json["remark"]],
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
    "countryName": countryNameValues.reverse[countryName],
    "baseSchoolNameId": baseSchoolNameId,
    "courseTitle": courseTitle,
    "courseNameId": courseNameId,
    "courseDurationId": courseDurationId,
    "noOfCandidates": noOfCandidates,
    "professional": professional,
    "nbcd": nbcd,
    "remark": remarkValues.reverse[remark],
    "orgName": orgName,
    "candidates": candidates,
    "submittedReport": submittedReport,
    "sanctionAmount": sanctionAmount,
    "countWeek": countWeek,
    "completeWeek": completeWeek,
  };
}

enum CountryName {
  BANGLADESH
}

final countryNameValues = EnumValues({
  "Bangladesh": CountryName.BANGLADESH
});

enum Remark {
  EMPTY,
  INCLUDING_01_WEEK_MIDTERM_LEAVE_02_WEEK_NBCD,
  NA,
  REMARK_NA,
  THE_1526_OCT_2023_NBCD
}

final remarkValues = EnumValues({
  "": Remark.EMPTY,
  "Including (01 Week Midterm Leave & 02 Week NBCD)": Remark.INCLUDING_01_WEEK_MIDTERM_LEAVE_02_WEEK_NBCD,
  "NA": Remark.NA,
  "na": Remark.REMARK_NA,
  "15-26 Oct 2023 (NBCD)": Remark.THE_1526_OCT_2023_NBCD
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
