// To parse this JSON data, do
//
//     final obtainMarkList = obtainMarkListFromJson(jsonString);

import 'dart:convert';

List<ObtainMarkList> obtainMarkListFromJson(String str) => List<ObtainMarkList>.from(json.decode(str).map((x) => ObtainMarkList.fromJson(x)));

String obtainMarkListToJson(List<ObtainMarkList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ObtainMarkList {
  String ?subjectName;
  double? obtaintMark;
  String ?totalMark;
  String ?passMarkBna;
  int ?reExamStatus;

  ObtainMarkList({
    this.subjectName,
     this.obtaintMark,
    this.totalMark,
    this.passMarkBna,
     this.reExamStatus,
  });

  factory ObtainMarkList.fromJson(Map<String, dynamic> json) => ObtainMarkList(
    subjectName: json["subjectName"],
    obtaintMark: json["obtaintMark"],
    totalMark: json["totalMark"],
    passMarkBna: json["passMarkBNA"],
    reExamStatus: json["reExamStatus"],
  );

  Map<String, dynamic> toJson() => {
    "subjectName": subjectName,
    "obtaintMark": obtaintMark,
    "totalMark": totalMark,
    "passMarkBNA": passMarkBna,
    "reExamStatus": reExamStatus,
  };
}
