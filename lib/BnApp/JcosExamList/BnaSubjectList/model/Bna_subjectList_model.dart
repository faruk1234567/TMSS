class BnaSubjectListModel {
  String? branchName;
  String? subjectName;
  Null? total;
  Null? pass;
  Null? fail;
  String? totalMark;
  String? passMarkBNA;
  String? qExamTime;
  Null? examDate;
  int? courseDurationId;
  int? bnaSubjectNameId;

  BnaSubjectListModel(
      {this.branchName,
        this.subjectName,
        this.total,
        this.pass,
        this.fail,
        this.totalMark,
        this.passMarkBNA,
        this.qExamTime,
        this.examDate,
        this.courseDurationId,
        this.bnaSubjectNameId});

  BnaSubjectListModel.fromJson(Map<String, dynamic> json) {
    branchName = json['branchName'];
    subjectName = json['subjectName'];
    total = json['total'];
    pass = json['pass'];
    fail = json['fail'];
    totalMark = json['totalMark'];
    passMarkBNA = json['passMarkBNA'];
    qExamTime = json['qExamTime'];
    examDate = json['examDate'];
    courseDurationId = json['courseDurationId'];
    bnaSubjectNameId = json['bnaSubjectNameId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchName'] = this.branchName;
    data['subjectName'] = this.subjectName;
    data['total'] = this.total;
    data['pass'] = this.pass;
    data['fail'] = this.fail;
    data['totalMark'] = this.totalMark;
    data['passMarkBNA'] = this.passMarkBNA;
    data['qExamTime'] = this.qExamTime;
    data['examDate'] = this.examDate;
    data['courseDurationId'] = this.courseDurationId;
    data['bnaSubjectNameId'] = this.bnaSubjectNameId;
    return data;
  }
}
