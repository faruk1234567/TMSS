// To parse this JSON data, do
//
//     final schoolNoticeModel = schoolNoticeModelFromJson(jsonString);

import 'dart:convert';

List<SchoolNoticeModel> schoolNoticeModelFromJson(String str) => List<SchoolNoticeModel>.from(json.decode(str).map((x) => SchoolNoticeModel.fromJson(x)));

String schoolNoticeModelToJson(List<SchoolNoticeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolNoticeModel {
  int? noticeId;
  int? baseSchoolNameId;
  dynamic courseDurationId;
  dynamic courseNameId;
  dynamic traineeNominationId;
  dynamic courseInstructorId;
  int ?status;
  String? noticeHeading;
  DateTime? endDate;
  String? noticeDetails;
  dynamic menuPosition;
  String? createdBy;
  DateTime? dateCreated;
  String? lastModifiedBy;
  DateTime? lastModifiedDate;
  bool? isActive;
  String ?schoolName;
  dynamic courseTitle;
  dynamic course;
  String ?newStatus;

  SchoolNoticeModel({
    this.noticeId,
    this.baseSchoolNameId,
    this.courseDurationId,
    this.courseNameId,
    this.traineeNominationId,
    this.courseInstructorId,
    this.status,
    this.noticeHeading,
    this.endDate,
    this.noticeDetails,
    this.menuPosition,
    this.createdBy,
    this.dateCreated,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.isActive,
    this.schoolName,
    this.courseTitle,
    this.course,
    this.newStatus,
  });

  factory SchoolNoticeModel.fromJson(Map<String, dynamic> json) => SchoolNoticeModel(
    noticeId: json["noticeId"],
    baseSchoolNameId: json["baseSchoolNameId"],
    courseDurationId: json["courseDurationId"],
    courseNameId: json["courseNameId"],
    traineeNominationId: json["traineeNominationId"],
    courseInstructorId: json["courseInstructorId"],
    status: json["status"],
    noticeHeading: json["noticeHeading"],
    endDate: DateTime.parse(json["endDate"]),
    noticeDetails: json["noticeDetails"],
    menuPosition: json["menuPosition"],
    createdBy: json["createdBy"],
    dateCreated: DateTime.parse(json["dateCreated"]),
    lastModifiedBy: json["lastModifiedBy"],
    lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
    isActive: json["isActive"],
    schoolName: json["schoolName"],
    courseTitle: json["courseTitle"],
    course: json["course"],
    newStatus: json["newStatus"],
  );

  Map<String, dynamic> toJson() => {
    "noticeId": noticeId,
    "baseSchoolNameId": baseSchoolNameId,
    "courseDurationId": courseDurationId,
    "courseNameId": courseNameId,
    "traineeNominationId": traineeNominationId,
    "courseInstructorId": courseInstructorId,
    "status": status,
    "noticeHeading": noticeHeading,
    "endDate": endDate?.toIso8601String(),
    "noticeDetails": noticeDetails,
    "menuPosition": menuPosition,
    "createdBy": createdBy,
    "dateCreated": dateCreated?.toIso8601String(),
    "lastModifiedBy": lastModifiedBy,
    "lastModifiedDate": lastModifiedDate?.toIso8601String(),
    "isActive": isActive,
    "schoolName": schoolName,
    "courseTitle": courseTitle,
    "course": course,
    "newStatus": newStatus,
  };
}
