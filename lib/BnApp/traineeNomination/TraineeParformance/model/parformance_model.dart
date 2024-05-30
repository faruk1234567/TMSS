// To parse this JSON data, do
//
//     final parformanceList = parformanceListFromJson(jsonString);

import 'dart:convert';

List<ParformanceList> parformanceListFromJson(String str) => List<ParformanceList>.from(json.decode(str).map((x) => ParformanceList.fromJson(x)));

String parformanceListToJson(List<ParformanceList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParformanceList {
  String ?subjectName;
  int? totalMark;
  double? obtaintMark;
  dynamic highestMark;

  ParformanceList({
    this.subjectName,
    this.totalMark,
    this.obtaintMark,
    this.highestMark,
  });

  factory ParformanceList.fromJson(Map<String, dynamic> json) => ParformanceList(
    subjectName: json["subjectName"],
    totalMark: json["totalMark"],
    obtaintMark: json["obtaintMark"],
    highestMark: json["highestMark"],
  );

  Map<String, dynamic> toJson() => {
    "subjectName": subjectName,
    "totalMark": totalMark,
    "obtaintMark": obtaintMark,
    "highestMark": highestMark,
  };
}
