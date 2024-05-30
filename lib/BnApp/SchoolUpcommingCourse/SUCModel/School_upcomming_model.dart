// To parse this JSON data, do
//
//     final sUpcommingModel = sUpcommingModelFromJson(jsonString);

import 'dart:convert';

List<SupcommingModel> sUpcommingModelFromJson(String str) => List<SupcommingModel>.from(json.decode(str).map((x) => SupcommingModel.fromJson(x)));

String sUpcommingModelToJson(List<SupcommingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupcommingModel {
  String ?schoolName;
  String ?course;
  DateTime? durationFrom;
  DateTime? durationTo;
  String ?courseTitle;
  int ?baseSchoolNameId;
  int? courseNameId;
  int? courseDurationId;
  String? noOfCandidates;
  int? nbcdSchoolId;
  String ?professional;
  String ?nbcd;
  Remark? remark;

  SupcommingModel({
    this.schoolName,
    this.course,
    this.durationFrom,
    this.durationTo,
    this.courseTitle,
    this.baseSchoolNameId,
    this.courseNameId,
    this.courseDurationId,
    this.noOfCandidates,
    this.nbcdSchoolId,
    this.professional,
    this.nbcd,
    this.remark,
  });

  factory SupcommingModel.fromJson(Map<String, dynamic> json) => SupcommingModel(
    schoolName: json["schoolName"],
    course: json["course"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
    courseTitle: json["courseTitle"],
    baseSchoolNameId: json["baseSchoolNameId"],
    courseNameId: json["courseNameId"],
    courseDurationId: json["courseDurationId"],
    noOfCandidates: json["noOfCandidates"],
    nbcdSchoolId: json["nbcdSchoolId"],
    professional: json["professional"],
    nbcd: json["nbcd"],
    remark: remarkValues.map[json["remark"]],
  );

  Map<String, dynamic> toJson() => {
    "schoolName": schoolName,
    "course": course,
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
    "courseTitle": courseTitle,
    "baseSchoolNameId": baseSchoolNameId,
    "courseNameId": courseNameId,
    "courseDurationId": courseDurationId,
    "noOfCandidates": noOfCandidates,
    "nbcdSchoolId": nbcdSchoolId,
    "professional": professional,
    "nbcd": nbcd,
    "remark": remarkValues.reverse[remark],
  };
}

enum Remark {
  EMPTY,
  THE_1526_OCT_2023_NBCD
}

final remarkValues = EnumValues({
  "": Remark.EMPTY,
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
