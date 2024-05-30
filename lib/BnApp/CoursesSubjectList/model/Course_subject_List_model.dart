// To parse this JSON data, do
//
//     final coursesSubjectList = coursesSubjectListFromJson(jsonString);

import 'dart:convert';

List<CoursesSubjectList> coursesSubjectListFromJson(String str) => List<CoursesSubjectList>.from(json.decode(str).map((x) => CoursesSubjectList.fromJson(x)));

String coursesSubjectListToJson(List<CoursesSubjectList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoursesSubjectList {
  int ?bnaSubjectNameId;
  int? courseModuleId;
  dynamic? bnaSemesterId;
  dynamic? subjectCategoryId;
  dynamic ?bnaSubjectCurriculumId;
  int? courseNameId;
  dynamic? courseName;
  dynamic? courseTypeId;
  dynamic ?branchId;
  dynamic ?saylorBranchId;
  dynamic? saylorSubBranchId;
  int? resultStatusId;
  int ?subjectTypeId;
  int? kindOfSubjectId;
  int ?baseSchoolNameId;
  dynamic subjectClassificationId;
  String ?subjectName;
  String? subjectNameBangla;
  String ?subjectShortName;
  String? subjectCode;
  String ?totalMark;
  String? passMarkBna;
  String? passMarkBup;
  String ?classTestMark;
  String ?assignmentMark;
  String? caseStudyMark;
  String? totalPeriod;
  dynamic qExamTime;
  dynamic remarks;
  int ?subjectGreading;
  int? status;
  dynamic paperNo;
  int? menuPosition;
  bool? isActive;
  int ?subjectActiveStatus;
  dynamic contactHour;
  dynamic creditHour;
  dynamic subjectCategoryName;
  dynamic bnaSubjectCurriculum;
  dynamic ?subjectType;
  String ?courseModule;
  KindOfSubject? kindOfSubject;
  dynamic subjectClassification;
  dynamic resultStatus;
  dynamic branch;
  dynamic saylorBranch;

  CoursesSubjectList({
    this.bnaSubjectNameId,
    this.courseModuleId,
    this.bnaSemesterId,
    this.subjectCategoryId,
    this.bnaSubjectCurriculumId,
    this.courseNameId,
    this.courseName,
    this.courseTypeId,
    this.branchId,
    this.saylorBranchId,
    this.saylorSubBranchId,
    this.resultStatusId,
    this.subjectTypeId,
    this.kindOfSubjectId,
    this.baseSchoolNameId,
    this.subjectClassificationId,
    this.subjectName,
    this.subjectNameBangla,
    this.subjectShortName,
    this.subjectCode,
    this.totalMark,
    this.passMarkBna,
    this.passMarkBup,
    this.classTestMark,
    this.assignmentMark,
    this.caseStudyMark,
    this.totalPeriod,
    this.qExamTime,
    this.remarks,
    this.subjectGreading,
    this.status,
    this.paperNo,
    this.menuPosition,
    this.isActive,
    this.subjectActiveStatus,
    this.contactHour,
    this.creditHour,
    this.subjectCategoryName,
    this.bnaSubjectCurriculum,
    this.subjectType,
    this.courseModule,
    this.kindOfSubject,
    this.subjectClassification,
    this.resultStatus,
    this.branch,
    this.saylorBranch,
  });

  factory CoursesSubjectList.fromJson(Map<String, dynamic> json) => CoursesSubjectList(
    bnaSubjectNameId: json["bnaSubjectNameId"],
    courseModuleId: json["courseModuleId"],
    bnaSemesterId: json["bnaSemesterId"],
    subjectCategoryId: json["subjectCategoryId"],
    bnaSubjectCurriculumId: json["bnaSubjectCurriculumId"],
    courseNameId: json["courseNameId"],
    courseName: json["courseName"],
    courseTypeId: json["courseTypeId"],
    branchId: json["branchId"],
    saylorBranchId: json["saylorBranchId"],
    saylorSubBranchId: json["saylorSubBranchId"],
    resultStatusId: json["resultStatusId"],
    subjectTypeId: json["subjectTypeId"],
    kindOfSubjectId: json["kindOfSubjectId"],
    baseSchoolNameId: json["baseSchoolNameId"],
    subjectClassificationId: json["subjectClassificationId"],
    subjectName: json["subjectName"],
    subjectNameBangla: json["subjectNameBangla"],
    subjectShortName: json["subjectShortName"],
    subjectCode: json["subjectCode"],
    totalMark: json["totalMark"],
    passMarkBna: json["passMarkBna"],
    passMarkBup: json["passMarkBup"],
    classTestMark: json["classTestMark"],
    assignmentMark: json["assignmentMark"],
    caseStudyMark: json["caseStudyMark"],
    totalPeriod: json["totalPeriod"],
    qExamTime: json["qExamTime"],
    remarks: json["remarks"],
    subjectGreading: json["subjectGreading"],
    status: json["status"],
    paperNo: json["paperNo"],
    menuPosition: json["menuPosition"],
    isActive: json["isActive"],
    subjectActiveStatus: json["subjectActiveStatus"],
    contactHour: json["contactHour"],
    creditHour: json["creditHour"],
    subjectCategoryName: json["subjectCategoryName"],
    bnaSubjectCurriculum: json["bnaSubjectCurriculum"],
    subjectType: json["subjectType"],
    courseModule: json["courseModule"],
    kindOfSubject: kindOfSubjectValues.map[json["kindOfSubject"]],
    subjectClassification: json["subjectClassification"],
    resultStatus: json["resultStatus"],
    branch: json["branch"],
    saylorBranch: json["saylorBranch"],
  );

  Map<String, dynamic> toJson() => {
    "bnaSubjectNameId": bnaSubjectNameId,
    "courseModuleId": courseModuleId,
    "bnaSemesterId": bnaSemesterId,
    "subjectCategoryId": subjectCategoryId,
    "bnaSubjectCurriculumId": bnaSubjectCurriculumId,
    "courseNameId": courseNameId,
    "courseName": courseName,
    "courseTypeId": courseTypeId,
    "branchId": branchId,
    "saylorBranchId": saylorBranchId,
    "saylorSubBranchId": saylorSubBranchId,
    "resultStatusId": resultStatusId,
    "subjectTypeId": subjectTypeId,
    "kindOfSubjectId": kindOfSubjectId,
    "baseSchoolNameId": baseSchoolNameId,
    "subjectClassificationId": subjectClassificationId,
    "subjectName": subjectName,
    "subjectNameBangla": subjectNameBangla,
    "subjectShortName": subjectShortName,
    "subjectCode": subjectCode,
    "totalMark": totalMark,
    "passMarkBna": passMarkBna,
    "passMarkBup": passMarkBup,
    "classTestMark": classTestMark,
    "assignmentMark": assignmentMark,
    "caseStudyMark": caseStudyMark,
    "totalPeriod": totalPeriod,
    "qExamTime": qExamTime,
    "remarks": remarks,
    "subjectGreading": subjectGreading,
    "status": status,
    "paperNo": paperNo,
    "menuPosition": menuPosition,
    "isActive": isActive,
    "subjectActiveStatus": subjectActiveStatus,
    "contactHour": contactHour,
    "creditHour": creditHour,
    "subjectCategoryName": subjectCategoryName,
    "bnaSubjectCurriculum": bnaSubjectCurriculum,
    "subjectType": subjectTypeValues.reverse[subjectType],
    "courseModule": courseModuleValues.reverse[courseModule],
    "kindOfSubject": kindOfSubjectValues.reverse[kindOfSubject],
    "subjectClassification": subjectClassification,
    "resultStatus": resultStatus,
    "branch": branch,
    "saylorBranch": saylorBranch,
  };
}

enum CourseModule {
  MODULE_I,
  MODULE_II,
  MODULE_III,
  MODULE_IV
}

final courseModuleValues = EnumValues({
  "Module-I": CourseModule.MODULE_I,
  "Module-II": CourseModule.MODULE_II,
  "Module-III": CourseModule.MODULE_III,
  "Module-IV": CourseModule.MODULE_IV
});

enum KindOfSubject {
  PROFESSIONAL
}

final kindOfSubjectValues = EnumValues({
  "Professional": KindOfSubject.PROFESSIONAL
});

enum SubjectType {
  MAJOR,
  MINOR
}

final subjectTypeValues = EnumValues({
  "Major": SubjectType.MAJOR,
  "Minor": SubjectType.MINOR
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
