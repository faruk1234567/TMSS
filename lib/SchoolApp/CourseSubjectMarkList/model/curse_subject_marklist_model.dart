// To parse this JSON data, do
//
//     final subjectMarkListModel = subjectMarkListModelFromJson(jsonString);

import 'dart:convert';

List<SubjectMarkListModel> subjectMarkListModelFromJson(String str) => List<SubjectMarkListModel>.from(json.decode(str).map((x) => SubjectMarkListModel.fromJson(x)));

String subjectMarkListModelToJson(List<SubjectMarkListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectMarkListModel {
  int? subjectMarkId;
  int? baseSchoolNameId;
  int ?courseNameId;
  dynamic bnaSemesterId;
  dynamic bnaSubjectCurriculumId;
  int ?bnaSubjectNameId;
  dynamic branchId;
  dynamic saylorBranchId;
  dynamic saylorSubBranchId;
  int ?courseModuleId;
  dynamic markCategoryId;
  int? markTypeId;
  dynamic? passMark;
  dynamic ?mark;
  dynamic remarks;
  dynamic status;
  dynamic menuPosition;
  bool? isActive;
  String? baseSchoolName;
  String ?bnaSubjectName;
  dynamic subjectCurriculumName;
  String ?courseModule;
  String ?courseName;
  dynamic bnaSemester;
  String? markType;
  dynamic markCategory;

  SubjectMarkListModel({
    this.subjectMarkId,
    this.baseSchoolNameId,
    this.courseNameId,
    this.bnaSemesterId,
    this.bnaSubjectCurriculumId,
    this.bnaSubjectNameId,
    this.branchId,
    this.saylorBranchId,
    this.saylorSubBranchId,
    this.courseModuleId,
    this.markCategoryId,
    this.markTypeId,
    this.passMark,
    this.mark,
    this.remarks,
    this.status,
    this.menuPosition,
    this.isActive,
    this.baseSchoolName,
    this.bnaSubjectName,
    this.subjectCurriculumName,
    this.courseModule,
    this.courseName,
    this.bnaSemester,
    this.markType,
    this.markCategory,
  });

  factory SubjectMarkListModel.fromJson(Map<String, dynamic> json) => SubjectMarkListModel(
    subjectMarkId: json["subjectMarkId"],
    baseSchoolNameId: json["baseSchoolNameId"],
    courseNameId: json["courseNameId"],
    bnaSemesterId: json["bnaSemesterId"],
    bnaSubjectCurriculumId: json["bnaSubjectCurriculumId"],
    bnaSubjectNameId: json["bnaSubjectNameId"],
    branchId: json["branchId"],
    saylorBranchId: json["saylorBranchId"],
    saylorSubBranchId: json["saylorSubBranchId"],
    courseModuleId: json["courseModuleId"],
    markCategoryId: json["markCategoryId"],
    markTypeId: json["markTypeId"],
    passMark: json["passMark"],
    mark: json["mark"],
    remarks: json["remarks"],
    status: json["status"],
    menuPosition: json["menuPosition"],
    isActive: json["isActive"],
    baseSchoolName: json["baseSchoolName"],
    bnaSubjectName: json["bnaSubjectName"],
    subjectCurriculumName: json["subjectCurriculumName"],
    courseModule: json["courseModule"],
    courseName: json["courseName"],
    bnaSemester: json["bnaSemester"],
    markType: json["markType"],
    markCategory: json["markCategory"],
  );

  Map<String, dynamic> toJson() => {
    "subjectMarkId": subjectMarkId,
    "baseSchoolNameId": baseSchoolNameId,
    "courseNameId": courseNameId,
    "bnaSemesterId": bnaSemesterId,
    "bnaSubjectCurriculumId": bnaSubjectCurriculumId,
    "bnaSubjectNameId": bnaSubjectNameId,
    "branchId": branchId,
    "saylorBranchId": saylorBranchId,
    "saylorSubBranchId": saylorSubBranchId,
    "courseModuleId": courseModuleId,
    "markCategoryId": markCategoryId,
    "markTypeId": markTypeId,
    "passMark": passMark,
    "mark": mark,
    "remarks": remarks,
    "status": status,
    "menuPosition": menuPosition,
    "isActive": isActive,
    "baseSchoolName": baseSchoolName,
    "bnaSubjectName": bnaSubjectName,
    "subjectCurriculumName": subjectCurriculumName,
    "courseModule": courseModule,
    "courseName": courseName,
    "bnaSemester": bnaSemester,
    "markType": markType,
    "markCategory": markCategory,
  };
}
