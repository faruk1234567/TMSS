import 'dart:convert';

List<OrganizationModel> organizationModelFromJson(String str) =>
    List<OrganizationModel>.from(
        json.decode(str).map((x) => OrganizationModel.fromJson(x)));

String organizationModelToJson(List<OrganizationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrganizationModel {
  int? baseSchoolNameId;
  int? baseNameId;
  String? schoolName;
  String? shortName;
  dynamic schoolLogo;
  dynamic status;
  dynamic menuPosition;
  bool? isActive;
  dynamic contactPerson;
  dynamic address;
  dynamic telephone;
  dynamic cellphone;
  dynamic email;
  dynamic fax;
  int? branchLevel;
  int? firstLevel;
  dynamic secondLevel;
  dynamic thirdLevel;
  dynamic fourthLevel;
  dynamic fifthLevel;
  dynamic serverName;
  dynamic schoolHistory;
  dynamic baseName;

  OrganizationModel({
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

  factory OrganizationModel.fromJson(Map<String, dynamic> json) =>
      OrganizationModel(
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
