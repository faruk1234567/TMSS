class MistModel {
  List<Items>? items;
  int? totalPages;
  int? itemsFrom;
  int? itemsTo;
  int? totalItemsCount;

  MistModel(
      {this.items,
        this.totalPages,
        this.itemsFrom,
        this.itemsTo,
        this.totalItemsCount});

  MistModel.fromJson(Map<String, dynamic> json) {
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
  int? courseDurationId;
  int? courseNameId;
  int? baseSchoolNameId;
  dynamic? baseNameId;
  int? courseTypeId;
  dynamic? countryId;
  dynamic? organizationNameId;
  dynamic? fiscalYearId;
  String? courseTitle;
  String? noOfCandidates;
  DateTime? durationFrom;
  DateTime? durationTo;
  String? professional;
  String? nbcd;
  String? remark;
  int? isCompletedStatus;
  dynamic? isApproved;
  dynamic? approvedBy;
  dynamic? approvedDate;
  int? status;
  dynamic? menuPosition;
  bool? isActive;
  dynamic? nbcdSchoolId;
  dynamic? nbcdDurationFrom;
  dynamic? nbcdDurationTo;
  dynamic? nbcdStatus;
  dynamic? comeFromNbcdDurationId;
  dynamic? baseSchoolName;
  dynamic? country;
  String? courseName;
  String? courseSyllabus;
  dynamic? organizationName;
  String? courseType;
  dynamic? fiscalYear;

  Items(
      {this.courseDurationId,
        this.courseNameId,
        this.baseSchoolNameId,
        this.baseNameId,
        this.courseTypeId,
        this.countryId,
        this.organizationNameId,
        this.fiscalYearId,
        this.courseTitle,
        this.noOfCandidates,
        this.durationFrom,
        this.durationTo,
        this.professional,
        this.nbcd,
        this.remark,
        this.isCompletedStatus,
        this.isApproved,
        this.approvedBy,
        this.approvedDate,
        this.status,
        this.menuPosition,
        this.isActive,
        this.nbcdSchoolId,
        this.nbcdDurationFrom,
        this.nbcdDurationTo,
        this.nbcdStatus,
        this.comeFromNbcdDurationId,
        this.baseSchoolName,
        this.country,
        this.courseName,
        this.courseSyllabus,
        this.organizationName,
        this.courseType,
        this.fiscalYear});

  Items.fromJson(Map<String, dynamic> json) {
    courseDurationId = json['courseDurationId'];
    courseNameId = json['courseNameId'];
    baseSchoolNameId = json['baseSchoolNameId'];
    baseNameId = json['baseNameId'];
    courseTypeId = json['courseTypeId'];
    countryId = json['countryId'];
    organizationNameId = json['organizationNameId'];
    fiscalYearId = json['fiscalYearId'];
    courseTitle = json['courseTitle'];
    noOfCandidates = json['noOfCandidates'];
    durationFrom = DateTime.parse(json["durationFrom"]);
    durationTo = DateTime.parse(json["durationTo"]);
    professional = json['professional'];
    nbcd = json['nbcd'];
    remark = json['remark'];
    isCompletedStatus = json['isCompletedStatus'];
    isApproved = json['isApproved'];
    approvedBy = json['approvedBy'];
    approvedDate = json['approvedDate'];
    status = json['status'];
    menuPosition = json['menuPosition'];
    isActive = json['isActive'];
    nbcdSchoolId = json['nbcdSchoolId'];
    nbcdDurationFrom = json['nbcdDurationFrom'];
    nbcdDurationTo = json['nbcdDurationTo'];
    nbcdStatus = json['nbcdStatus'];
    comeFromNbcdDurationId = json['comeFromNbcdDurationId'];
    baseSchoolName = json['baseSchoolName'];
    country = json['country'];
    courseName = json['courseName'];
    courseSyllabus = json['courseSyllabus'];
    organizationName = json['organizationName'];
    courseType = json['courseType'];
    fiscalYear = json['fiscalYear'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseDurationId'] = this.courseDurationId;
    data['courseNameId'] = this.courseNameId;
    data['baseSchoolNameId'] = this.baseSchoolNameId;
    data['baseNameId'] = this.baseNameId;
    data['courseTypeId'] = this.courseTypeId;
    data['countryId'] = this.countryId;
    data['organizationNameId'] = this.organizationNameId;
    data['fiscalYearId'] = this.fiscalYearId;
    data['courseTitle'] = this.courseTitle;
    data['noOfCandidates'] = this.noOfCandidates;
    data['durationFrom'] = this.durationFrom;
    data['durationTo'] = this.durationTo;
    data['professional'] = this.professional;
    data['nbcd'] = this.nbcd;
    data['remark'] = this.remark;
    data['isCompletedStatus'] = this.isCompletedStatus;
    data['isApproved'] = this.isApproved;
    data['approvedBy'] = this.approvedBy;
    data['approvedDate'] = this.approvedDate;
    data['status'] = this.status;
    data['menuPosition'] = this.menuPosition;
    data['isActive'] = this.isActive;
    data['nbcdSchoolId'] = this.nbcdSchoolId;
    data['nbcdDurationFrom'] = this.nbcdDurationFrom;
    data['nbcdDurationTo'] = this.nbcdDurationTo;
    data['nbcdStatus'] = this.nbcdStatus;
    data['comeFromNbcdDurationId'] = this.comeFromNbcdDurationId;
    data['baseSchoolName'] = this.baseSchoolName;
    data['country'] = this.country;
    data['courseName'] = this.courseName;
    data['courseSyllabus'] = this.courseSyllabus;
    data['organizationName'] = this.organizationName;
    data['courseType'] = this.courseType;
    data['fiscalYear'] = this.fiscalYear;
    return data;
  }
}
