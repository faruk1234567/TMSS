// To parse this JSON data, do
//
//     final traineeCertificateModel = traineeCertificateModelFromJson(jsonString);

import 'dart:convert';

List<TraineeCertificateModel> traineeCertificateModelFromJson(String str) => List<TraineeCertificateModel>.from(json.decode(str).map((x) => TraineeCertificateModel.fromJson(x)));

String traineeCertificateModelToJson(List<TraineeCertificateModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TraineeCertificateModel {
  dynamic certificateSerialNo;
  String? pno;
  String? name;
  dynamic traineeRank;
  String? course;
  DateTime? durationFrom;
  DateTime? durationTo;
  int ?totalTrainee;
  int? weeks;
  int? subjectTotalMark;
  dynamic ?totalObtained;
  int ?position;
  dynamic ?obtained;

  TraineeCertificateModel({
    this.certificateSerialNo,
    this.pno,
    this.name,
    this.traineeRank,
    this.course,
    this.durationFrom,
    this.durationTo,
    this.totalTrainee,
    this.weeks,
    this.subjectTotalMark,
    this.totalObtained,
    this.position,
    this.obtained,
  });

  factory TraineeCertificateModel.fromJson(Map<String, dynamic> json) => TraineeCertificateModel(
    certificateSerialNo: json["certificateSerialNo"],
    pno: json["pno"],
    name: json["name"],
    traineeRank: json["traineeRank"],
    course: json["course"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
    totalTrainee: json["totalTrainee"],
    weeks: json["weeks"],
    subjectTotalMark: json["subjectTotalMark"],
    totalObtained: json["totalObtained"],
    position: json["position"],
    obtained: json["obtained"]
  );

  Map<String, dynamic> toJson() => {
    "certificateSerialNo": certificateSerialNo,
    "pno": pno,
    "name": name,
    "traineeRank": traineeRank,
    "course": course,
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
    "totalTrainee": totalTrainee,
    "weeks": weeks,
    "subjectTotalMark": subjectTotalMark,
    "totalObtained": totalObtained,
    "position": position,
    "obtained": obtained,
  };
}
