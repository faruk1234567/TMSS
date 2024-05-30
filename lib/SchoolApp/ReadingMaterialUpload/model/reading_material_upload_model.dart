// To parse this JSON data, do
//
//     final readinMuModel = readinMuModelFromJson(jsonString);

import 'dart:convert';

ReadinMuModel readinMuModelFromJson(String str) => ReadinMuModel.fromJson(json.decode(str));

String readinMuModelToJson(ReadinMuModel data) => json.encode(data.toJson());

class ReadinMuModel {
  List<Item>? items;
  int ?totalPages;
  int? itemsFrom;
  int? itemsTo;
  int? totalItemsCount;

  ReadinMuModel({
    this.items,
    this.totalPages,
    this.itemsFrom,
    this.itemsTo,
    this.totalItemsCount,
  });

  factory ReadinMuModel.fromJson(Map<String, dynamic> json) => ReadinMuModel(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    totalPages: json["totalPages"],
    itemsFrom: json["itemsFrom"],
    itemsTo: json["itemsTo"],
    totalItemsCount: json["totalItemsCount"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    "totalPages": totalPages,
    "itemsFrom": itemsFrom,
    "itemsTo": itemsTo,
    "totalItemsCount": totalItemsCount,
  };
}

class Item {
  int ?readingMaterialId;
  int? readingMaterialTitleId;
  int? courseNameId;
  int? baseSchoolNameId;
  int ?documentTypeId;
  int? showRightId;
  int? downloadRightId;
  String? documentName;
  String? documentLink;
  bool? isApproved;
  DateTime? approvedDate;
  dynamic approvedUser;
  int? status;
  dynamic menuPosition;
  bool ?isActive;
  String ?readingMaterialTitle;
  String? courseName;
  String ?baseSchoolName;
  String? documentType;
  String ?documentIcon;
  String ?showRight;
  String? downloadRight;
  dynamic aurhorName;
  dynamic publisherName;

  Item({
    this.readingMaterialId,
    this.readingMaterialTitleId,
    this.courseNameId,
    this.baseSchoolNameId,
    this.documentTypeId,
    this.showRightId,
    this.downloadRightId,
    this.documentName,
    this.documentLink,
    this.isApproved,
    this.approvedDate,
    this.approvedUser,
    this.status,
    this.menuPosition,
    this.isActive,
    this.readingMaterialTitle,
    this.courseName,
    this.baseSchoolName,
    this.documentType,
    this.documentIcon,
    this.showRight,
    this.downloadRight,
    this.aurhorName,
    this.publisherName,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    readingMaterialId: json["readingMaterialId"],
    readingMaterialTitleId: json["readingMaterialTitleId"],
    courseNameId: json["courseNameId"],
    baseSchoolNameId: json["baseSchoolNameId"],
    documentTypeId: json["documentTypeId"],
    showRightId: json["showRightId"],
    downloadRightId: json["downloadRightId"],
    documentName: json["documentName"],
    documentLink: json["documentLink"],
    isApproved: json["isApproved"],
    approvedDate: DateTime.parse(json["approvedDate"]),
    approvedUser: json["approvedUser"],
    status: json["status"],
    menuPosition: json["menuPosition"],
    isActive: json["isActive"],
    readingMaterialTitle: json["readingMaterialTitle"],
    courseName: json["courseName"],
    baseSchoolName: json["baseSchoolName"],
    documentType: json["documentType"],
    documentIcon: json["documentIcon"],
    showRight: json["showRight"],
    downloadRight: json["downloadRight"],
    aurhorName: json["aurhorName"],
    publisherName: json["publisherName"],
  );

  Map<String, dynamic> toJson() => {
    "readingMaterialId": readingMaterialId,
    "readingMaterialTitleId": readingMaterialTitleId,
    "courseNameId": courseNameId,
    "baseSchoolNameId": baseSchoolNameId,
    "documentTypeId": documentTypeId,
    "showRightId": showRightId,
    "downloadRightId": downloadRightId,
    "documentName": documentName,
    "documentLink": documentLink,
    "isApproved": isApproved,
    "approvedDate": approvedDate?.toIso8601String(),
    "approvedUser": approvedUser,
    "status": status,
    "menuPosition": menuPosition,
    "isActive": isActive,
    "readingMaterialTitle": readingMaterialTitle,
    "courseName": courseName,
    "baseSchoolName": baseSchoolName,
    "documentType": documentType,
    "documentIcon": documentIcon,
    "showRight": showRight,
    "downloadRight": downloadRight,
    "aurhorName": aurhorName,
    "publisherName": publisherName,
  };
}
