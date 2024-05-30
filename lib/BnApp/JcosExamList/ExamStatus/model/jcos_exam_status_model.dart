class JExamStatusModel {
  Null? subjectName;
  Null? shortName;
  Null? moduleName;
  int? courseDurationId;
  int? coursetypeid;
  String? course;
  Null? pno;
  Null? position;
  Null? name;
  Null? attendanceComplete;
  Null? examMarkComplete;
  Null? resultSubmissionStatus;
  Null? finalApproveStatus;

  JExamStatusModel(
      {this.subjectName,
        this.shortName,
        this.moduleName,
        this.courseDurationId,
        this.coursetypeid,
        this.course,
        this.pno,
        this.position,
        this.name,
        this.attendanceComplete,
        this.examMarkComplete,
        this.resultSubmissionStatus,
        this.finalApproveStatus});

  JExamStatusModel.fromJson(Map<String, dynamic> json) {
    subjectName = json['subjectName'];
    shortName = json['shortName'];
    moduleName = json['moduleName'];
    courseDurationId = json['courseDurationId'];
    coursetypeid = json['coursetypeid'];
    course = json['course'];
    pno = json['pno'];
    position = json['position'];
    name = json['name'];
    attendanceComplete = json['attendanceComplete'];
    examMarkComplete = json['examMarkComplete'];
    resultSubmissionStatus = json['resultSubmissionStatus'];
    finalApproveStatus = json['finalApproveStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subjectName'] = this.subjectName;
    data['shortName'] = this.shortName;
    data['moduleName'] = this.moduleName;
    data['courseDurationId'] = this.courseDurationId;
    data['coursetypeid'] = this.coursetypeid;
    data['course'] = this.course;
    data['pno'] = this.pno;
    data['position'] = this.position;
    data['name'] = this.name;
    data['attendanceComplete'] = this.attendanceComplete;
    data['examMarkComplete'] = this.examMarkComplete;
    data['resultSubmissionStatus'] = this.resultSubmissionStatus;
    data['finalApproveStatus'] = this.finalApproveStatus;
    return data;
  }
}

