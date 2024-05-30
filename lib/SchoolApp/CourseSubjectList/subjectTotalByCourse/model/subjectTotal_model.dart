// To parse this JSON data, do
//
//     final subjectTotalMarkModel = subjectTotalMarkModelFromJson(jsonString);

import 'dart:convert';

List<SubjectTotalMarkModel> subjectTotalMarkModelFromJson(String str) => List<SubjectTotalMarkModel>.from(json.decode(str).map((x) => SubjectTotalMarkModel.fromJson(x)));

String subjectTotalMarkModelToJson(List<SubjectTotalMarkModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectTotalMarkModel {
  dynamic ?passMark;
  dynamic? totalPeriod;
  dynamic? totalMark;

  SubjectTotalMarkModel({
    this.passMark,
    this.totalPeriod,
    this.totalMark,
  });

  factory SubjectTotalMarkModel.fromJson(Map<String, dynamic> json) => SubjectTotalMarkModel(
    passMark: json["passMark"],
    totalPeriod: json["totalPeriod"],
    totalMark: json["totalMark"],
  );

  Map<String, dynamic> toJson() => {
    "passMark": passMark,
    "totalPeriod": totalPeriod,
    "totalMark": totalMark,
  };
}
