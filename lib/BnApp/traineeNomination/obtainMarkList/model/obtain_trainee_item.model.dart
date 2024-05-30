class TraineeItemModel {
  List<Items>? items;
  int? totalPages;
  int? itemsFrom;
  int? itemsTo;
  int? totalItemsCount;

  TraineeItemModel(
      {this.items,
        this.totalPages,
        this.itemsFrom,
        this.itemsTo,
        this.totalItemsCount});

  TraineeItemModel.fromJson(Map<String, dynamic> json) {
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
  int? traineeNominationId;
  int? courseDurationId;
  int? bnaSemesterDurationId;
  int? courseNameId;
  Null? departmentId;
  Null? bnaSubjectCurriculumId;
  Null? examAttemptTypeId;
  Null? examTypeId;
  int? traineeId;
  Null? saylorRankId;
  int? rankId;
  Null? courseSectionId;
  Null? saylorBranchId;
  Null? saylorSubBranchId;
  int? branchId;
  int? courseAttendState;
  Null? certificateSerialNo;
  Null? courseAttendStateRemark;
  Null? examCenterId;
  Null? newAtemptId;
  Null? indexNo;
  Null? presentBillet;
  Null? familyAllowId;
  Null? traineeCourseStatusId;
  Null? withdrawnDocId;
  Null? withdrawnTypeId;
  String? withdrawnRemarks;
  Null? withdrawnDate;
  int? status;
  Null? menuPosition;
  bool? isActive;
  Null? bnaAttendanceRemarksId;
  Null? attendanceStatus;
  Null? classLeaderName;
  Null? attendanceDate;
  String? courseDuration;
  Null? traineeCourseStatus;
  String? courseName;
  Null? withdrawnDoc;
  String? traineeName;
  String? rankName;
  String? traineePNo;
  String? rankPosition;
  String? schoolName;
  Null? examCenter;
  String? createdBy;
  String? dateCreated;
  Null? ticket;
  Null? visa;
  Null? passport;
  Null? covidTest;
  Null? medicalTest;
  Null? dgfiBreafing;
  Null? dniBreafing;
  Null? embassiBreafing;
  Null? financialSanction;
  Null? exBdLeave;
  Null? familyGo;
  Null? medicalDocument;
  Null? remark;
  Null? foreignCourseOtherDocId;
  String? trainee;
  Null? newAtempt;
  String? traineeDOB;
  String? traineeJoiningDate;
  Null? saylorBranch;
  Null? saylorRank;
  int? traineeStatusId;
  Null? withdrawnType;

  Items(
      {this.traineeNominationId,
        this.courseDurationId,
        this.bnaSemesterDurationId,
        this.courseNameId,
        this.departmentId,
        this.bnaSubjectCurriculumId,
        this.examAttemptTypeId,
        this.examTypeId,
        this.traineeId,
        this.saylorRankId,
        this.rankId,
        this.courseSectionId,
        this.saylorBranchId,
        this.saylorSubBranchId,
        this.branchId,
        this.courseAttendState,
        this.certificateSerialNo,
        this.courseAttendStateRemark,
        this.examCenterId,
        this.newAtemptId,
        this.indexNo,
        this.presentBillet,
        this.familyAllowId,
        this.traineeCourseStatusId,
        this.withdrawnDocId,
        this.withdrawnTypeId,
        this.withdrawnRemarks,
        this.withdrawnDate,
        this.status,
        this.menuPosition,
        this.isActive,
        this.bnaAttendanceRemarksId,
        this.attendanceStatus,
        this.classLeaderName,
        this.attendanceDate,
        this.courseDuration,
        this.traineeCourseStatus,
        this.courseName,
        this.withdrawnDoc,
        this.traineeName,
        this.rankName,
        this.traineePNo,
        this.rankPosition,
        this.schoolName,
        this.examCenter,
        this.createdBy,
        this.dateCreated,
        this.ticket,
        this.visa,
        this.passport,
        this.covidTest,
        this.medicalTest,
        this.dgfiBreafing,
        this.dniBreafing,
        this.embassiBreafing,
        this.financialSanction,
        this.exBdLeave,
        this.familyGo,
        this.medicalDocument,
        this.remark,
        this.foreignCourseOtherDocId,
        this.trainee,
        this.newAtempt,
        this.traineeDOB,
        this.traineeJoiningDate,
        this.saylorBranch,
        this.saylorRank,
        this.traineeStatusId,
        this.withdrawnType});

  Items.fromJson(Map<String, dynamic> json) {
    traineeNominationId = json['traineeNominationId'];
    courseDurationId = json['courseDurationId'];
    bnaSemesterDurationId = json['bnaSemesterDurationId'];
    courseNameId = json['courseNameId'];
    departmentId = json['departmentId'];
    bnaSubjectCurriculumId = json['bnaSubjectCurriculumId'];
    examAttemptTypeId = json['examAttemptTypeId'];
    examTypeId = json['examTypeId'];
    traineeId = json['traineeId'];
    saylorRankId = json['saylorRankId'];
    rankId = json['rankId'];
    courseSectionId = json['courseSectionId'];
    saylorBranchId = json['saylorBranchId'];
    saylorSubBranchId = json['saylorSubBranchId'];
    branchId = json['branchId'];
    courseAttendState = json['courseAttendState'];
    certificateSerialNo = json['certificateSerialNo'];
    courseAttendStateRemark = json['courseAttendStateRemark'];
    examCenterId = json['examCenterId'];
    newAtemptId = json['newAtemptId'];
    indexNo = json['indexNo'];
    presentBillet = json['presentBillet'];
    familyAllowId = json['familyAllowId'];
    traineeCourseStatusId = json['traineeCourseStatusId'];
    withdrawnDocId = json['withdrawnDocId'];
    withdrawnTypeId = json['withdrawnTypeId'];
    withdrawnRemarks = json['withdrawnRemarks'];
    withdrawnDate = json['withdrawnDate'];
    status = json['status'];
    menuPosition = json['menuPosition'];
    isActive = json['isActive'];
    bnaAttendanceRemarksId = json['bnaAttendanceRemarksId'];
    attendanceStatus = json['attendanceStatus'];
    classLeaderName = json['classLeaderName'];
    attendanceDate = json['attendanceDate'];
    courseDuration = json['courseDuration'];
    traineeCourseStatus = json['traineeCourseStatus'];
    courseName = json['courseName'];
    withdrawnDoc = json['withdrawnDoc'];
    traineeName = json['traineeName'];
    rankName = json['rankName'];
    traineePNo = json['traineePNo'];
    rankPosition = json['rankPosition'];
    schoolName = json['schoolName'];
    examCenter = json['examCenter'];
    createdBy = json['createdBy'];
    dateCreated = json['dateCreated'];
    ticket = json['ticket'];
    visa = json['visa'];
    passport = json['passport'];
    covidTest = json['covidTest'];
    medicalTest = json['medicalTest'];
    dgfiBreafing = json['dgfiBreafing'];
    dniBreafing = json['dniBreafing'];
    embassiBreafing = json['embassiBreafing'];
    financialSanction = json['financialSanction'];
    exBdLeave = json['exBdLeave'];
    familyGo = json['familyGo'];
    medicalDocument = json['medicalDocument'];
    remark = json['remark'];
    foreignCourseOtherDocId = json['foreignCourseOtherDocId'];
    trainee = json['trainee'];
    newAtempt = json['newAtempt'];
    traineeDOB = json['traineeDOB'];
    traineeJoiningDate = json['traineeJoiningDate'];
    saylorBranch = json['saylorBranch'];
    saylorRank = json['saylorRank'];
    traineeStatusId = json['traineeStatusId'];
    withdrawnType = json['withdrawnType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['traineeNominationId'] = this.traineeNominationId;
    data['courseDurationId'] = this.courseDurationId;
    data['bnaSemesterDurationId'] = this.bnaSemesterDurationId;
    data['courseNameId'] = this.courseNameId;
    data['departmentId'] = this.departmentId;
    data['bnaSubjectCurriculumId'] = this.bnaSubjectCurriculumId;
    data['examAttemptTypeId'] = this.examAttemptTypeId;
    data['examTypeId'] = this.examTypeId;
    data['traineeId'] = this.traineeId;
    data['saylorRankId'] = this.saylorRankId;
    data['rankId'] = this.rankId;
    data['courseSectionId'] = this.courseSectionId;
    data['saylorBranchId'] = this.saylorBranchId;
    data['saylorSubBranchId'] = this.saylorSubBranchId;
    data['branchId'] = this.branchId;
    data['courseAttendState'] = this.courseAttendState;
    data['certificateSerialNo'] = this.certificateSerialNo;
    data['courseAttendStateRemark'] = this.courseAttendStateRemark;
    data['examCenterId'] = this.examCenterId;
    data['newAtemptId'] = this.newAtemptId;
    data['indexNo'] = this.indexNo;
    data['presentBillet'] = this.presentBillet;
    data['familyAllowId'] = this.familyAllowId;
    data['traineeCourseStatusId'] = this.traineeCourseStatusId;
    data['withdrawnDocId'] = this.withdrawnDocId;
    data['withdrawnTypeId'] = this.withdrawnTypeId;
    data['withdrawnRemarks'] = this.withdrawnRemarks;
    data['withdrawnDate'] = this.withdrawnDate;
    data['status'] = this.status;
    data['menuPosition'] = this.menuPosition;
    data['isActive'] = this.isActive;
    data['bnaAttendanceRemarksId'] = this.bnaAttendanceRemarksId;
    data['attendanceStatus'] = this.attendanceStatus;
    data['classLeaderName'] = this.classLeaderName;
    data['attendanceDate'] = this.attendanceDate;
    data['courseDuration'] = this.courseDuration;
    data['traineeCourseStatus'] = this.traineeCourseStatus;
    data['courseName'] = this.courseName;
    data['withdrawnDoc'] = this.withdrawnDoc;
    data['traineeName'] = this.traineeName;
    data['rankName'] = this.rankName;
    data['traineePNo'] = this.traineePNo;
    data['rankPosition'] = this.rankPosition;
    data['schoolName'] = this.schoolName;
    data['examCenter'] = this.examCenter;
    data['createdBy'] = this.createdBy;
    data['dateCreated'] = this.dateCreated;
    data['ticket'] = this.ticket;
    data['visa'] = this.visa;
    data['passport'] = this.passport;
    data['covidTest'] = this.covidTest;
    data['medicalTest'] = this.medicalTest;
    data['dgfiBreafing'] = this.dgfiBreafing;
    data['dniBreafing'] = this.dniBreafing;
    data['embassiBreafing'] = this.embassiBreafing;
    data['financialSanction'] = this.financialSanction;
    data['exBdLeave'] = this.exBdLeave;
    data['familyGo'] = this.familyGo;
    data['medicalDocument'] = this.medicalDocument;
    data['remark'] = this.remark;
    data['foreignCourseOtherDocId'] = this.foreignCourseOtherDocId;
    data['trainee'] = this.trainee;
    data['newAtempt'] = this.newAtempt;
    data['traineeDOB'] = this.traineeDOB;
    data['traineeJoiningDate'] = this.traineeJoiningDate;
    data['saylorBranch'] = this.saylorBranch;
    data['saylorRank'] = this.saylorRank;
    data['traineeStatusId'] = this.traineeStatusId;
    data['withdrawnType'] = this.withdrawnType;
    return data;
  }
}
