// To parse this JSON data, do
//
//     final sailorsOfficersModel = sailorsOfficersModelFromJson(jsonString);

import 'dart:convert';

List<CourseWeekDurationModel> sailorsOfficersModelFromJson(String str) => List<CourseWeekDurationModel>.from(json.decode(str).map((x) => CourseWeekDurationModel.fromJson(x)));

String sailorsOfficersModelToJson(List<CourseWeekDurationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseWeekDurationModel {
  int ?courseWeekId;
  int ?courseDurationId;
  int? bnaSemesterDurationId;
  int? courseNameId;
  int ?baseSchoolNameId;
  dynamic? weekName;
  DateTime? dateFrom;
  DateTime? dateTo;
  dynamic remarks;
  dynamic? status;
  dynamic menuPosition;
  String ?createdBy;
  DateTime? dateCreated;
  String ?lastModifiedBy;
  DateTime ?lastModifiedDate;
  bool ?isActive;

  CourseWeekDurationModel({
    this.courseWeekId,
    this.courseDurationId,
    this.bnaSemesterDurationId,
    this.courseNameId,
    this.baseSchoolNameId,
    this.weekName,
    this.dateFrom,
    this.dateTo,
    this.remarks,
    this.status,
    this.menuPosition,
    this.createdBy,
    this.dateCreated,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.isActive,
  });

  factory CourseWeekDurationModel.fromJson(Map<String, dynamic> json) => CourseWeekDurationModel(
    courseWeekId: json["courseWeekId"],
    courseDurationId: json["courseDurationId"],
    bnaSemesterDurationId: json["bnaSemesterDurationId"],
    courseNameId: json["courseNameId"],
    baseSchoolNameId: json["baseSchoolNameId"],
    weekName: json["weekName"],
    dateFrom: DateTime.parse(json["dateFrom"]),
    dateTo: DateTime.parse(json["dateTo"]),
    remarks: json["remarks"],
    status: json["status"],
    menuPosition: json["menuPosition"],
    createdBy: json["createdBy"],
    dateCreated: DateTime.parse(json["dateCreated"]),
    lastModifiedBy: json["lastModifiedBy"],
    lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "courseWeekId": courseWeekId,
    "courseDurationId": courseDurationId,
    "bnaSemesterDurationId": bnaSemesterDurationId,
    "courseNameId": courseNameId,
    "baseSchoolNameId": baseSchoolNameId,
    "weekName": weekName,
    "dateFrom": dateFrom?.toIso8601String(),
    "dateTo": dateTo?.toIso8601String(),
    "remarks": remarks,
    "status": status,
    "menuPosition": menuPosition,
    "createdBy": createdBy,
    "dateCreated": dateCreated?.toIso8601String(),
    "lastModifiedBy": lastModifiedBy,
    "lastModifiedDate": lastModifiedDate?.toIso8601String(),
    "isActive": isActive,
  };
}
