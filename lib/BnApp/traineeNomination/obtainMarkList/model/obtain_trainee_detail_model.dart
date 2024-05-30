// To parse this JSON data, do
//
//     final obtainTraineeDetailModel = obtainTraineeDetailModelFromJson(jsonString);

import 'dart:convert';

ObtainTraineeDetailModel obtainTraineeDetailModelFromJson(String str) => ObtainTraineeDetailModel.fromJson(json.decode(str));

String obtainTraineeDetailModelToJson(ObtainTraineeDetailModel data) => json.encode(data.toJson());

class ObtainTraineeDetailModel {
  int ?traineeId;
  int ?bnaBatchId;
  int? rankId;
  int? branchId;
  int ?divisionId;
  int? districtId;
  int? thanaId;
  int ?heightId;
  int? weightId;
  int ?colorOfEyeId;
  int ?genderId;
  int?bloodGroupId;
  int? nationalityId;
  dynamic countryId;
  int? religionId;
  int ?casteId;
  int ?maritalStatusId;
  int ?hairColorId;
  int? officerTypeId;
  dynamic saylorBranchId;
  dynamic saylorRankId;
  dynamic saylorSubBranchId;
  String ?name;
  String? nickName;
  String?nameBangla;
  String ?chestNo;
  String ?localNo;
  String ?idCardNo;
  String? shoeSize;
  String ?pantSize;
  String? nominee;
  String ?closeRelative;
  String? relativeRelation;
  String? mobile;
  String ?email;
  dynamic bnaPhotoUrl;
  String ?bnaNo;
  String ?pno;
  dynamic shortCode;
  dynamic presentBillet;
  DateTime? dateOfBirth;
  DateTime? joiningDate;
  String ?identificationMark;
  String? presentAddress;
  String? permanentAddress;
  int? traineeStatusId;
  String ?passportNo;
  String? nid;
  String? remarks;
  int? menuPosition;
  bool ?isActive;
  int ?localNominationStatus;
  dynamic seniority;
  dynamic place;
  dynamic medicalCategory;
  dynamic marriedDate;
  dynamic familyLocation;
  dynamic nameofWife;
  dynamic bankAccount;
  dynamic emergencyCommunicatePerson;
  dynamic countryVisited;
  dynamic dislikeness;
  dynamic likeness;
  dynamic hobbies;
  dynamic sports;
  dynamic bnaBatch;
  dynamic traineeStatus;
  dynamic rank;
  dynamic hairColor;
  dynamic country;
  dynamic saylorBranch;
  dynamic saylorRank;
  dynamic saylorSubBranch;

  ObtainTraineeDetailModel({
    this.traineeId,
    this.bnaBatchId,
    this.rankId,
    this.branchId,
    this.divisionId,
    this.districtId,
    this.thanaId,
    this.heightId,
    this.weightId,
    this.colorOfEyeId,
    this.genderId,
    this.bloodGroupId,
    this.nationalityId,
    this.countryId,
    this.religionId,
    this.casteId,
    this.maritalStatusId,
    this.hairColorId,
    this.officerTypeId,
    this.saylorBranchId,
    this.saylorRankId,
    this.saylorSubBranchId,
    this.name,
    this.nickName,
    this.nameBangla,
    this.chestNo,
    this.localNo,
    this.idCardNo,
    this.shoeSize,
    this.pantSize,
    this.nominee,
    this.closeRelative,
    this.relativeRelation,
    this.mobile,
    this.email,
    this.bnaPhotoUrl,
    this.bnaNo,
    this.pno,
    this.shortCode,
    this.presentBillet,
    this.dateOfBirth,
    this.joiningDate,
    this.identificationMark,
    this.presentAddress,
    this.permanentAddress,
    this.traineeStatusId,
    this.passportNo,
    this.nid,
    this.remarks,
    this.menuPosition,
    this.isActive,
    this.localNominationStatus,
    this.seniority,
    this.place,
    this.medicalCategory,
    this.marriedDate,
    this.familyLocation,
    this.nameofWife,
    this.bankAccount,
    this.emergencyCommunicatePerson,
    this.countryVisited,
    this.dislikeness,
    this.likeness,
    this.hobbies,
    this.sports,
    this.bnaBatch,
    this.traineeStatus,
    this.rank,
    this.hairColor,
    this.country,
    this.saylorBranch,
    this.saylorRank,
    this.saylorSubBranch,
  });

  factory ObtainTraineeDetailModel.fromJson(Map<String, dynamic> json) => ObtainTraineeDetailModel(
    traineeId: json["traineeId"],
    bnaBatchId: json["bnaBatchId"],
    rankId: json["rankId"],
    branchId: json["branchId"],
    divisionId: json["divisionId"],
    districtId: json["districtId"],
    thanaId: json["thanaId"],
    heightId: json["heightId"],
    weightId: json["weightId"],
    colorOfEyeId: json["colorOfEyeId"],
    genderId: json["genderId"],
    bloodGroupId: json["bloodGroupId"],
    nationalityId: json["nationalityId"],
    countryId: json["countryId"],
    religionId: json["religionId"],
    casteId: json["casteId"],
    maritalStatusId: json["maritalStatusId"],
    hairColorId: json["hairColorId"],
    officerTypeId: json["officerTypeId"],
    saylorBranchId: json["saylorBranchId"],
    saylorRankId: json["saylorRankId"],
    saylorSubBranchId: json["saylorSubBranchId"],
    name: json["name"],
    nickName: json["nickName"],
    nameBangla: json["nameBangla"],
    chestNo: json["chestNo"],
    localNo: json["localNo"],
    idCardNo: json["idCardNo"],
    shoeSize: json["shoeSize"],
    pantSize: json["pantSize"],
    nominee: json["nominee"],
    closeRelative: json["closeRelative"],
    relativeRelation: json["relativeRelation"],
    mobile: json["mobile"],
    email: json["email"],
    bnaPhotoUrl: json["bnaPhotoUrl"],
    bnaNo: json["bnaNo"],
    pno: json["pno"],
    shortCode: json["shortCode"],
    presentBillet: json["presentBillet"],
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
    joiningDate: DateTime.parse(json["joiningDate"]),
    identificationMark: json["identificationMark"],
    presentAddress: json["presentAddress"],
    permanentAddress: json["permanentAddress"],
    traineeStatusId: json["traineeStatusId"],
    passportNo: json["passportNo"],
    nid: json["nid"],
    remarks: json["remarks"],
    menuPosition: json["menuPosition"],
    isActive: json["isActive"],
    localNominationStatus: json["localNominationStatus"],
    seniority: json["seniority"],
    place: json["place"],
    medicalCategory: json["medicalCategory"],
    marriedDate: json["marriedDate"],
    familyLocation: json["familyLocation"],
    nameofWife: json["nameofWife"],
    bankAccount: json["bankAccount"],
    emergencyCommunicatePerson: json["emergencyCommunicatePerson"],
    countryVisited: json["countryVisited"],
    dislikeness: json["dislikeness"],
    likeness: json["likeness"],
    hobbies: json["hobbies"],
    sports: json["sports"],
    bnaBatch: json["bnaBatch"],
    traineeStatus: json["traineeStatus"],
    rank: json["rank"],
    hairColor: json["hairColor"],
    country: json["country"],
    saylorBranch: json["saylorBranch"],
    saylorRank: json["saylorRank"],
    saylorSubBranch: json["saylorSubBranch"],
  );

  Map<String, dynamic> toJson() => {
    "traineeId": traineeId,
    "bnaBatchId": bnaBatchId,
    "rankId": rankId,
    "branchId": branchId,
    "divisionId": divisionId,
    "districtId": districtId,
    "thanaId": thanaId,
    "heightId": heightId,
    "weightId": weightId,
    "colorOfEyeId": colorOfEyeId,
    "genderId": genderId,
    "bloodGroupId": bloodGroupId,
    "nationalityId": nationalityId,
    "countryId": countryId,
    "religionId": religionId,
    "casteId": casteId,
    "maritalStatusId": maritalStatusId,
    "hairColorId": hairColorId,
    "officerTypeId": officerTypeId,
    "saylorBranchId": saylorBranchId,
    "saylorRankId": saylorRankId,
    "saylorSubBranchId": saylorSubBranchId,
    "name": name,
    "nickName": nickName,
    "nameBangla": nameBangla,
    "chestNo": chestNo,
    "localNo": localNo,
    "idCardNo": idCardNo,
    "shoeSize": shoeSize,
    "pantSize": pantSize,
    "nominee": nominee,
    "closeRelative": closeRelative,
    "relativeRelation": relativeRelation,
    "mobile": mobile,
    "email": email,
    "bnaPhotoUrl": bnaPhotoUrl,
    "bnaNo": bnaNo,
    "pno": pno,
    "shortCode": shortCode,
    "presentBillet": presentBillet,
    "dateOfBirth": dateOfBirth?.toIso8601String(),
    "joiningDate": joiningDate?.toIso8601String(),
    "identificationMark": identificationMark,
    "presentAddress": presentAddress,
    "permanentAddress": permanentAddress,
    "traineeStatusId": traineeStatusId,
    "passportNo": passportNo,
    "nid": nid,
    "remarks": remarks,
    "menuPosition": menuPosition,
    "isActive": isActive,
    "localNominationStatus": localNominationStatus,
    "seniority": seniority,
    "place": place,
    "medicalCategory": medicalCategory,
    "marriedDate": marriedDate,
    "familyLocation": familyLocation,
    "nameofWife": nameofWife,
    "bankAccount": bankAccount,
    "emergencyCommunicatePerson": emergencyCommunicatePerson,
    "countryVisited": countryVisited,
    "dislikeness": dislikeness,
    "likeness": likeness,
    "hobbies": hobbies,
    "sports": sports,
    "bnaBatch": bnaBatch,
    "traineeStatus": traineeStatus,
    "rank": rank,
    "hairColor": hairColor,
    "country": country,
    "saylorBranch": saylorBranch,
    "saylorRank": saylorRank,
    "saylorSubBranch": saylorSubBranch,
  };
}
