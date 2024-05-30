class OthersOfficerBioModel {
  List<Items>? items;
  int? totalPages;
  int? itemsFrom;
  int? itemsTo;
  int? totalItemsCount;

  OthersOfficerBioModel(
      {this.items,
        this.totalPages,
        this.itemsFrom,
        this.itemsTo,
        this.totalItemsCount});

  OthersOfficerBioModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
    itemsFrom = json['itemsFrom'];
    itemsTo = json['itemsTo'];
    totalItemsCount = json['totalItemsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = this.totalPages;
    data['itemsFrom'] = this.itemsFrom;
    data['itemsTo'] = this.itemsTo;
    data['totalItemsCount'] = this.totalItemsCount;
    return data;
  }
}

class Items {
  int? traineeId;
  int? bnaBatchId;
  int? rankId;
  int? branchId;
  int? divisionId;
  int? districtId;
  int? thanaId;
  int? heightId;
  int? weightId;
  int? colorOfEyeId;
  int? genderId;
  int? bloodGroupId;
  dynamic? nationalityId;
  int? countryId;
  int? religionId;
  int? casteId;
  dynamic? maritalStatusId;
  int? hairColorId;
  int? officerTypeId;
  dynamic? saylorBranchId;
  dynamic? saylorRankId;
  dynamic? saylorSubBranchId;
  String? name;
  String? nickName;
  String? nameBangla;
  String? chestNo;
  String? localNo;
  String? idCardNo;
  String? shoeSize;
  String? pantSize;
  String? nominee;
  String? closeRelative;
  String? relativeRelation;
  String? mobile;
  String? email;
  String? bnaPhotoUrl;
  String? bnaNo;
  String? pno;
  String? shortCode;
  String? presentBillet;
  String? dateOfBirth;
  DateTime? joiningDate;
  String? identificationMark;
  String? presentAddress;
  String? permanentAddress;
  int? traineeStatusId;
  String? passportNo;
  String? nid;
  String? remarks;
  dynamic? menuPosition;
  bool? isActive;
  int? localNominationStatus;
  dynamic? seniority;
  dynamic? place;
  dynamic? medicalCategory;
  dynamic? marriedDate;
  dynamic? familyLocation;
  dynamic? nameofWife;
  dynamic? bankAccount;
  dynamic? emergencyCommunicatePerson;
  dynamic? countryVisited;
  dynamic? dislikeness;
  dynamic? likeness;
  dynamic? hobbies;
  dynamic? sports;
  String? bnaBatch;
  String? traineeStatus;
  String? rank;
  dynamic? hairColor;
  dynamic? country;
  dynamic? saylorBranch;
  dynamic? saylorRank;
  dynamic? saylorSubBranch;

  Items(
      {this.traineeId,
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
        this.saylorSubBranch});

  Items.fromJson(Map<String, dynamic> json) {
    traineeId = json['traineeId'];
    bnaBatchId = json['bnaBatchId'];
    rankId = json['rankId'];
    branchId = json['branchId'];
    divisionId = json['divisionId'];
    districtId = json['districtId'];
    thanaId = json['thanaId'];
    heightId = json['heightId'];
    weightId = json['weightId'];
    colorOfEyeId = json['colorOfEyeId'];
    genderId = json['genderId'];
    bloodGroupId = json['bloodGroupId'];
    nationalityId = json['nationalityId'];
    countryId = json['countryId'];
    religionId = json['religionId'];
    casteId = json['casteId'];
    maritalStatusId = json['maritalStatusId'];
    hairColorId = json['hairColorId'];
    officerTypeId = json['officerTypeId'];
    saylorBranchId = json['saylorBranchId'];
    saylorRankId = json['saylorRankId'];
    saylorSubBranchId = json['saylorSubBranchId'];
    name = json['name'];
    nickName = json['nickName'];
    nameBangla = json['nameBangla'];
    chestNo = json['chestNo'];
    localNo = json['localNo'];
    idCardNo = json['idCardNo'];
    shoeSize = json['shoeSize'];
    pantSize = json['pantSize'];
    nominee = json['nominee'];
    closeRelative = json['closeRelative'];
    relativeRelation = json['relativeRelation'];
    mobile = json['mobile'];
    email = json['email'];
    bnaPhotoUrl = json['bnaPhotoUrl'];
    bnaNo = json['bnaNo'];
    pno = json['pno'];
    shortCode = json['shortCode'];
    presentBillet = json['presentBillet'];
    dateOfBirth = json['dateOfBirth'];
    joiningDate =  DateTime.parse(json["joiningDate"]);
    identificationMark = json['identificationMark'];
    presentAddress = json['presentAddress'];
    permanentAddress = json['permanentAddress'];
    traineeStatusId = json['traineeStatusId'];
    passportNo = json['passportNo'];
    nid = json['nid'];
    remarks = json['remarks'];
    menuPosition = json['menuPosition'];
    isActive = json['isActive'];
    localNominationStatus = json['localNominationStatus'];
    seniority = json['seniority'];
    place = json['place'];
    medicalCategory = json['medicalCategory'];
    marriedDate = json['marriedDate'];
    familyLocation = json['familyLocation'];
    nameofWife = json['nameofWife'];
    bankAccount = json['bankAccount'];
    emergencyCommunicatePerson = json['emergencyCommunicatePerson'];
    countryVisited = json['countryVisited'];
    dislikeness = json['dislikeness'];
    likeness = json['likeness'];
    hobbies = json['hobbies'];
    sports = json['sports'];
    bnaBatch = json['bnaBatch'];
    traineeStatus = json['traineeStatus'];
    rank = json['rank'];
    hairColor = json['hairColor'];
    country = json['country'];
    saylorBranch = json['saylorBranch'];
    saylorRank = json['saylorRank'];
    saylorSubBranch = json['saylorSubBranch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['traineeId'] = this.traineeId;
    data['bnaBatchId'] = this.bnaBatchId;
    data['rankId'] = this.rankId;
    data['branchId'] = this.branchId;
    data['divisionId'] = this.divisionId;
    data['districtId'] = this.districtId;
    data['thanaId'] = this.thanaId;
    data['heightId'] = this.heightId;
    data['weightId'] = this.weightId;
    data['colorOfEyeId'] = this.colorOfEyeId;
    data['genderId'] = this.genderId;
    data['bloodGroupId'] = this.bloodGroupId;
    data['nationalityId'] = this.nationalityId;
    data['countryId'] = this.countryId;
    data['religionId'] = this.religionId;
    data['casteId'] = this.casteId;
    data['maritalStatusId'] = this.maritalStatusId;
    data['hairColorId'] = this.hairColorId;
    data['officerTypeId'] = this.officerTypeId;
    data['saylorBranchId'] = this.saylorBranchId;
    data['saylorRankId'] = this.saylorRankId;
    data['saylorSubBranchId'] = this.saylorSubBranchId;
    data['name'] = this.name;
    data['nickName'] = this.nickName;
    data['nameBangla'] = this.nameBangla;
    data['chestNo'] = this.chestNo;
    data['localNo'] = this.localNo;
    data['idCardNo'] = this.idCardNo;
    data['shoeSize'] = this.shoeSize;
    data['pantSize'] = this.pantSize;
    data['nominee'] = this.nominee;
    data['closeRelative'] = this.closeRelative;
    data['relativeRelation'] = this.relativeRelation;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['bnaPhotoUrl'] = this.bnaPhotoUrl;
    data['bnaNo'] = this.bnaNo;
    data['pno'] = this.pno;
    data['shortCode'] = this.shortCode;
    data['presentBillet'] = this.presentBillet;
    data['dateOfBirth'] = this.dateOfBirth;
    data['joiningDate'] = this.joiningDate;
    data['identificationMark'] = this.identificationMark;
    data['presentAddress'] = this.presentAddress;
    data['permanentAddress'] = this.permanentAddress;
    data['traineeStatusId'] = this.traineeStatusId;
    data['passportNo'] = this.passportNo;
    data['nid'] = this.nid;
    data['remarks'] = this.remarks;
    data['menuPosition'] = this.menuPosition;
    data['isActive'] = this.isActive;
    data['localNominationStatus'] = this.localNominationStatus;
    data['seniority'] = this.seniority;
    data['place'] = this.place;
    data['medicalCategory'] = this.medicalCategory;
    data['marriedDate'] = this.marriedDate;
    data['familyLocation'] = this.familyLocation;
    data['nameofWife'] = this.nameofWife;
    data['bankAccount'] = this.bankAccount;
    data['emergencyCommunicatePerson'] = this.emergencyCommunicatePerson;
    data['countryVisited'] = this.countryVisited;
    data['dislikeness'] = this.dislikeness;
    data['likeness'] = this.likeness;
    data['hobbies'] = this.hobbies;
    data['sports'] = this.sports;
    data['bnaBatch'] = this.bnaBatch;
    data['traineeStatus'] = this.traineeStatus;
    data['rank'] = this.rank;
    data['hairColor'] = this.hairColor;
    data['country'] = this.country;
    data['saylorBranch'] = this.saylorBranch;
    data['saylorRank'] = this.saylorRank;
    data['saylorSubBranch'] = this.saylorSubBranch;
    return data;
  }
}
