// To parse this JSON data, do
//
//     final obtainCourseDurationDetailModel = obtainCourseDurationDetailModelFromJson(jsonString);

import 'dart:convert';

ObtainCourseDurationDetailModel obtainCourseDurationDetailModelFromJson(String str) => ObtainCourseDurationDetailModel.fromJson(json.decode(str));

String obtainCourseDurationDetailModelToJson(ObtainCourseDurationDetailModel data) => json.encode(data.toJson());

class ObtainCourseDurationDetailModel {
  int ?courseDurationId;
  int? courseNameId;
  int ?baseSchoolNameId;
  int? baseNameId;
  int? courseTypeId;
  int? countryId;
  dynamic organizationNameId;
  dynamic fiscalYearId;
  String? courseTitle;
  String ?noOfCandidates;
  DateTime? durationFrom;
  DateTime? durationTo;
  String ?professional;
  String ?nbcd;
  String? remark;
  int ?isCompletedStatus;
  dynamic isApproved;
  dynamic approvedBy;
  dynamic approvedDate;
  int ?status;
  dynamic menuPosition;
  bool? isActive;
  int ?nbcdSchoolId;
  dynamic nbcdDurationFrom;
  dynamic nbcdDurationTo;
  dynamic nbcdStatus;
  dynamic comeFromNbcdDurationId;
  String?baseSchoolName;
  dynamic country;
  String ?courseName;
  String? courseSyllabus;
  dynamic organizationName;
  dynamic courseType;
  dynamic fiscalYear;

  ObtainCourseDurationDetailModel({
    this.courseDurationId,
    this.courseNameId,
    this.baseSchoolNameId,
    this.baseNameId,
    this.courseTypeId,
    this.countryId,
    this.organizationNameId,
    this.fiscalYearId,
    this.courseTitle,
    this.noOfCandidates,
    this.durationFrom,
    this.durationTo,
    this.professional,
    this.nbcd,
    this.remark,
    this.isCompletedStatus,
    this.isApproved,
    this.approvedBy,
    this.approvedDate,
    this.status,
    this.menuPosition,
    this.isActive,
    this.nbcdSchoolId,
    this.nbcdDurationFrom,
    this.nbcdDurationTo,
    this.nbcdStatus,
    this.comeFromNbcdDurationId,
    this.baseSchoolName,
    this.country,
    this.courseName,
    this.courseSyllabus,
    this.organizationName,
    this.courseType,
    this.fiscalYear,
  });

  factory ObtainCourseDurationDetailModel.fromJson(Map<String, dynamic> json) => ObtainCourseDurationDetailModel(
    courseDurationId: json["courseDurationId"],
    courseNameId: json["courseNameId"],
    baseSchoolNameId: json["baseSchoolNameId"],
    baseNameId: json["baseNameId"],
    courseTypeId: json["courseTypeId"],
    countryId: json["countryId"],
    organizationNameId: json["organizationNameId"],
    fiscalYearId: json["fiscalYearId"],
    courseTitle: json["courseTitle"],
    noOfCandidates: json["noOfCandidates"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
    professional: json["professional"],
    nbcd: json["nbcd"],
    remark: json["remark"],
    isCompletedStatus: json["isCompletedStatus"],
    isApproved: json["isApproved"],
    approvedBy: json["approvedBy"],
    approvedDate: json["approvedDate"],
    status: json["status"],
    menuPosition: json["menuPosition"],
    isActive: json["isActive"],
    nbcdSchoolId: json["nbcdSchoolId"],
    nbcdDurationFrom: json["nbcdDurationFrom"],
    nbcdDurationTo: json["nbcdDurationTo"],
    nbcdStatus: json["nbcdStatus"],
    comeFromNbcdDurationId: json["comeFromNbcdDurationId"],
    baseSchoolName: json["baseSchoolName"],
    country: json["country"],
    courseName: json["courseName"],
    courseSyllabus: json["courseSyllabus"],
    organizationName: json["organizationName"],
    courseType: json["courseType"],
    fiscalYear: json["fiscalYear"],
  );

  Map<String, dynamic> toJson() => {
    "courseDurationId": courseDurationId,
    "courseNameId": courseNameId,
    "baseSchoolNameId": baseSchoolNameId,
    "baseNameId": baseNameId,
    "courseTypeId": courseTypeId,
    "countryId": countryId,
    "organizationNameId": organizationNameId,
    "fiscalYearId": fiscalYearId,
    "courseTitle": courseTitle,
    "noOfCandidates": noOfCandidates,
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
    "professional": professional,
    "nbcd": nbcd,
    "remark": remark,
    "isCompletedStatus": isCompletedStatus,
    "isApproved": isApproved,
    "approvedBy": approvedBy,
    "approvedDate": approvedDate,
    "status": status,
    "menuPosition": menuPosition,
    "isActive": isActive,
    "nbcdSchoolId": nbcdSchoolId,
    "nbcdDurationFrom": nbcdDurationFrom,
    "nbcdDurationTo": nbcdDurationTo,
    "nbcdStatus": nbcdStatus,
    "comeFromNbcdDurationId": comeFromNbcdDurationId,
    "baseSchoolName": baseSchoolName,
    "country": country,
    "courseName": courseName,
    "courseSyllabus": courseSyllabus,
    "organizationName": organizationName,
    "courseType": courseType,
    "fiscalYear": fiscalYear,
  };
}
