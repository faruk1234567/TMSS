// To parse this JSON data, do
//
//     final instructorModel = instructorModelFromJson(jsonString);

import 'dart:convert';

List<InstructorModel> instructorModelFromJson(String str) => List<InstructorModel>.from(json.decode(str).map((x) => InstructorModel.fromJson(x)));

String instructorModelToJson(List<InstructorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InstructorModel {
  String ?name;
  String ?pno;
  dynamic ?shortCode;
  String? position;
  String? subjectShortName;

  InstructorModel({
    this.name,
    this.pno,
    this.shortCode,
    this.position,
    this.subjectShortName,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> json) => InstructorModel(
    name: json["name"],
    pno: json["pno"],
    shortCode: json["shortCode"],
    position: json["position"],
    subjectShortName: json["subjectShortName"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "pno": pno,
    "shortCode": shortCode,
    "position": position,
    "subjectShortName": subjectShortName,
  };
}
