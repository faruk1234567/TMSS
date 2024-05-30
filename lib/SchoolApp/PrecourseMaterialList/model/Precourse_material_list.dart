// To parse this JSON data, do
//
//     final preCourseMaterialModel = preCourseMaterialModelFromJson(jsonString);

import 'dart:convert';

List<PreCourseMaterialModel> preCourseMaterialModelFromJson(String str) => List<PreCourseMaterialModel>.from(json.decode(str).map((x) => PreCourseMaterialModel.fromJson(x)));

String preCourseMaterialModelToJson(List<PreCourseMaterialModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PreCourseMaterialModel {
  int ?courseNameId;
  String? course;
  int? baseschoolnameid;
  Schoolname ?schoolname;
  int? materialCount;

  PreCourseMaterialModel({
    this.courseNameId,
    this.course,
    this.baseschoolnameid,
    this.schoolname,
    this.materialCount,
  });

  factory PreCourseMaterialModel.fromJson(Map<String, dynamic> json) => PreCourseMaterialModel(
    courseNameId: json["courseNameId"],
    course: json["course"],
    baseschoolnameid: json["baseschoolnameid"],
    schoolname: schoolnameValues.map[json["schoolname"]],
    materialCount: json["materialCount"],
  );

  Map<String, dynamic> toJson() => {
    "courseNameId": courseNameId,
    "course": course,
    "baseschoolnameid": baseschoolnameid,
    "schoolname": schoolnameValues.reverse[schoolname],
    "materialCount": materialCount,
  };
}

enum Schoolname {
  ELECTRICAL_SCHOOL
}

final schoolnameValues = EnumValues({
  "Electrical School": Schoolname.ELECTRICAL_SCHOOL
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
