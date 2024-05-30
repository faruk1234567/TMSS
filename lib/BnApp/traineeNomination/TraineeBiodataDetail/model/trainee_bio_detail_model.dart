// To parse this JSON data, do
//
//     final traineeBioDetailModel = traineeBioDetailModelFromJson(jsonString);

import 'dart:convert';

List<TraineeBioDetailModel> traineeBioDetailModelFromJson(String str) => List<TraineeBioDetailModel>.from(json.decode(str).map((x) => TraineeBioDetailModel.fromJson(x)));

String traineeBioDetailModelToJson(List<TraineeBioDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TraineeBioDetailModel {
  dynamic bnaPhotoUrl;
  String? pno;
  String? rankPosition;
  dynamic seniority;
  String ?name;
  DateTime? dateOfCommission;
  String ?branchName;
  DateTime? dateOfBirth;
  dynamic birthPlace;
  String ?heightName;
  String? weightName;
  String? bloodGroupName;
  dynamic medicalCategory;
  String? religionName;
  String? maritalStatusName;
  dynamic marriedDate;
  String ?presentAddress;
  String? permanentAddress;
  dynamic fatherName;
  dynamic fatherOccupation;
  dynamic motherName;
  dynamic wifeName;
  dynamic bankAccount;
  dynamic emergencyCommunicatePerson;
  dynamic familyLocation;
  dynamic sports;
  dynamic hobbies;
  dynamic likeness;
  dynamic dislikeness;
  dynamic countryVisited;

  TraineeBioDetailModel({
    this.bnaPhotoUrl,
    this.pno,
    this.rankPosition,
    this.seniority,
    this.name,
    this.dateOfCommission,
    this.branchName,
    this.dateOfBirth,
    this.birthPlace,
    this.heightName,
    this.weightName,
    this.bloodGroupName,
    this.medicalCategory,
    this.religionName,
    this.maritalStatusName,
    this.marriedDate,
    this.presentAddress,
    this.permanentAddress,
    this.fatherName,
    this.fatherOccupation,
    this.motherName,
    this.wifeName,
    this.bankAccount,
    this.emergencyCommunicatePerson,
    this.familyLocation,
    this.sports,
    this.hobbies,
    this.likeness,
    this.dislikeness,
    this.countryVisited,
  });

  factory TraineeBioDetailModel.fromJson(Map<String, dynamic> json) => TraineeBioDetailModel(
    bnaPhotoUrl: json["bnaPhotoUrl"],
    pno: json["pno"],
    rankPosition: json["rankPosition"],
    seniority: json["seniority"],
    name: json["name"],
    dateOfCommission: DateTime.parse(json["dateOfCommission"]),
    branchName: json["branchName"],
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
    birthPlace: json["birthPlace"],
    heightName: json["heightName"],
    weightName: json["weightName"],
    bloodGroupName: json["bloodGroupName"],
    medicalCategory: json["medicalCategory"],
    religionName: json["religionName"],
    maritalStatusName: json["maritalStatusName"],
    marriedDate: json["marriedDate"],
    presentAddress: json["presentAddress"],
    permanentAddress: json["permanentAddress"],
    fatherName: json["fatherName"],
    fatherOccupation: json["fatherOccupation"],
    motherName: json["motherName"],
    wifeName: json["wifeName"],
    bankAccount: json["bankAccount"],
    emergencyCommunicatePerson: json["emergencyCommunicatePerson"],
    familyLocation: json["familyLocation"],
    sports: json["sports"],
    hobbies: json["hobbies"],
    likeness: json["likeness"],
    dislikeness: json["dislikeness"],
    countryVisited: json["countryVisited"],
  );

  Map<String, dynamic> toJson() => {
    "bnaPhotoUrl": bnaPhotoUrl,
    "pno": pno,
    "rankPosition": rankPosition,
    "seniority": seniority,
    "name": name,
    "dateOfCommission": dateOfCommission?.toIso8601String(),
    "branchName": branchName,
    "dateOfBirth": dateOfBirth?.toIso8601String(),
    "birthPlace": birthPlace,
    "heightName": heightName,
    "weightName": weightName,
    "bloodGroupName": bloodGroupName,
    "medicalCategory": medicalCategory,
    "religionName": religionName,
    "maritalStatusName": maritalStatusName,
    "marriedDate": marriedDate,
    "presentAddress": presentAddress,
    "permanentAddress": permanentAddress,
    "fatherName": fatherName,
    "fatherOccupation": fatherOccupation,
    "motherName": motherName,
    "wifeName": wifeName,
    "bankAccount": bankAccount,
    "emergencyCommunicatePerson": emergencyCommunicatePerson,
    "familyLocation": familyLocation,
    "sports": sports,
    "hobbies": hobbies,
    "likeness": likeness,
    "dislikeness": dislikeness,
    "countryVisited": countryVisited,
  };
}
