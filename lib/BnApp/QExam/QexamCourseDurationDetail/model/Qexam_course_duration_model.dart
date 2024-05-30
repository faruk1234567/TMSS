class QexamCourseDurationModel {
  int? courseDurationId;
  int? courseNameId;
  Null? baseSchoolNameId;
  Null? baseNameId;
  int? courseTypeId;
  Null? countryId;
  Null? organizationNameId;
  int? fiscalYearId;
  String? courseTitle;
  Null? noOfCandidates;
  String? durationFrom;
  String? durationTo;
  Null? professional;
  Null? nbcd;
  String? remark;
  int? isCompletedStatus;
  Null? isApproved;
  Null? approvedBy;
  Null? approvedDate;
  Null? status;
  Null? menuPosition;
  bool? isActive;
  Null? nbcdSchoolId;
  Null? nbcdDurationFrom;
  Null? nbcdDurationTo;
  Null? nbcdStatus;
  Null? comeFromNbcdDurationId;
  Null? baseSchoolName;
  Null? country;
  String? courseName;
  Null? courseSyllabus;
  Null? organizationName;
  Null? courseType;
  Null? fiscalYear;

  QexamCourseDurationModel(
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

  QexamCourseDurationModel.fromJson(Map<String, dynamic> json) {
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
    durationFrom = json['durationFrom'];
    durationTo = json['durationTo'];
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
