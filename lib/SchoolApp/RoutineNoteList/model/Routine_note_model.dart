// To parse this JSON data, do
//
//     final schoolRoutineModel = schoolRoutineModelFromJson(jsonString);

import 'dart:convert';

SchoolRoutineModel schoolRoutineModelFromJson(String str) => SchoolRoutineModel.fromJson(json.decode(str));

String schoolRoutineModelToJson(SchoolRoutineModel data) => json.encode(data.toJson());

class SchoolRoutineModel {
  List<Item>? items;
  int? totalPages;
  int? itemsFrom;
  int? itemsTo;
  int? totalItemsCount;

  SchoolRoutineModel({
    this.items,
    this.totalPages,
    this.itemsFrom,
    this.itemsTo,
    this.totalItemsCount,
  });

  factory SchoolRoutineModel.fromJson(Map<String, dynamic> json) => SchoolRoutineModel(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    totalPages: json["totalPages"],
    itemsFrom: json["itemsFrom"],
    itemsTo: json["itemsTo"],
    totalItemsCount: json["totalItemsCount"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items !.map((x) => x.toJson())),
    "totalPages": totalPages,
    "itemsFrom": itemsFrom,
    "itemsTo": itemsTo,
    "totalItemsCount": totalItemsCount,
  };
}

class Item {
  int ?routineNoteId;
  int ?baseSchoolNameId;
  dynamic classRoutineId;
  int ?courseNameId;
  int ?courseDurationId;
  int ?courseWeekId;
  dynamic bnaSubjectNameId;
  String? routineNotes;
  int? status;
  bool ?isActive;
  dynamic baseSchoolName;
  dynamic bnaSubjectName;
  dynamic classRoutine;
  String ?courseDuration;
  String? courseName;

  Item({
    this.routineNoteId,
    this.baseSchoolNameId,
    this.classRoutineId,
    this.courseNameId,
    this.courseDurationId,
    this.courseWeekId,
    this.bnaSubjectNameId,
    this.routineNotes,
    this.status,
    this.isActive,
    this.baseSchoolName,
    this.bnaSubjectName,
    this.classRoutine,
    this.courseDuration,
    this.courseName,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    routineNoteId: json["routineNoteId"],
    baseSchoolNameId: json["baseSchoolNameId"],
    classRoutineId: json["classRoutineId"],
    courseNameId: json["courseNameId"],
    courseDurationId: json["courseDurationId"],
    courseWeekId: json["courseWeekId"],
    bnaSubjectNameId: json["bnaSubjectNameId"],
    routineNotes: json["routineNotes"],
    status: json["status"],
    isActive: json["isActive"],
    baseSchoolName: json["baseSchoolName"],
    bnaSubjectName: json["bnaSubjectName"],
    classRoutine: json["classRoutine"],
    courseDuration: json["courseDuration"],
    courseName: json["courseName"],
  );

  Map<String, dynamic> toJson() => {
    "routineNoteId": routineNoteId,
    "baseSchoolNameId": baseSchoolNameId,
    "classRoutineId": classRoutineId,
    "courseNameId": courseNameId,
    "courseDurationId": courseDurationId,
    "courseWeekId": courseWeekId,
    "bnaSubjectNameId": bnaSubjectNameId,
    "routineNotes": routineNotes,
    "status": status,
    "isActive": isActive,
    "baseSchoolName": baseSchoolName,
    "bnaSubjectName": bnaSubjectName,
    "classRoutine": classRoutine,
    "courseDuration": courseDuration,
    "courseName": courseName,
  };
}
