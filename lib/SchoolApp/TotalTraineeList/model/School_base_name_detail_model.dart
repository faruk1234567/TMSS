// To parse this JSON data, do
//
//     final baseSchoolIdModel = baseSchoolIdModelFromJson(jsonString);

import 'dart:convert';

BaseSchoolIdModel baseSchoolIdModelFromJson(String str) => BaseSchoolIdModel.fromJson(json.decode(str));

String baseSchoolIdModelToJson(BaseSchoolIdModel data) => json.encode(data.toJson());

class BaseSchoolIdModel {
  int? baseSchoolNameId;
  dynamic baseNameId;
  String? schoolName;
  String? shortName;
  String? schoolLogo;
  dynamic status;
  dynamic menuPosition;
  bool? isActive;
  String? contactPerson;
  String? address;
  String? telephone;
  String? cellphone;
  String ?email;
  String ?fax;
  int ?branchLevel;
  int? firstLevel;
  int? secondLevel;
  int? thirdLevel;
  int? fourthLevel;
  dynamic fifthLevel;
  String? serverName;
  dynamic schoolHistory;
  dynamic baseName;

  BaseSchoolIdModel({
    this.baseSchoolNameId,
    this.baseNameId,
    this.schoolName,
    this.shortName,
    this.schoolLogo,
    this.status,
    this.menuPosition,
    this.isActive,
    this.contactPerson,
    this.address,
    this.telephone,
    this.cellphone,
    this.email,
    this.fax,
    this.branchLevel,
    this.firstLevel,
    this.secondLevel,
    this.thirdLevel,
    this.fourthLevel,
    this.fifthLevel,
    this.serverName,
    this.schoolHistory,
    this.baseName,
  });

  factory BaseSchoolIdModel.fromJson(Map<String, dynamic> json) => BaseSchoolIdModel(
    baseSchoolNameId: json["baseSchoolNameId"],
    baseNameId: json["baseNameId"],
    schoolName: json["schoolName"],
    shortName: json["shortName"],
    schoolLogo: json["schoolLogo"],
    status: json["status"],
    menuPosition: json["menuPosition"],
    isActive: json["isActive"],
    contactPerson: json["contactPerson"],
    address: json["address"],
    telephone: json["telephone"],
    cellphone: json["cellphone"],
    email: json["email"],
    fax: json["fax"],
    branchLevel: json["branchLevel"],
    firstLevel: json["firstLevel"],
    secondLevel: json["secondLevel"],
    thirdLevel: json["thirdLevel"],
    fourthLevel: json["fourthLevel"],
    fifthLevel: json["fifthLevel"],
    serverName: json["serverName"],
    schoolHistory: json["schoolHistory"],
    baseName: json["baseName"],
  );

  Map<String, dynamic> toJson() => {
    "baseSchoolNameId": baseSchoolNameId,
    "baseNameId": baseNameId,
    "schoolName": schoolName,
    "shortName": shortName,
    "schoolLogo": schoolLogo,
    "status": status,
    "menuPosition": menuPosition,
    "isActive": isActive,
    "contactPerson": contactPerson,
    "address": address,
    "telephone": telephone,
    "cellphone": cellphone,
    "email": email,
    "fax": fax,
    "branchLevel": branchLevel,
    "firstLevel": firstLevel,
    "secondLevel": secondLevel,
    "thirdLevel": thirdLevel,
    "fourthLevel": fourthLevel,
    "fifthLevel": fifthLevel,
    "serverName": serverName,
    "schoolHistory": schoolHistory,
    "baseName": baseName,
  };
}
