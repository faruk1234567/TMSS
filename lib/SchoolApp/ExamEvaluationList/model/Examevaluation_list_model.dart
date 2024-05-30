class ExamEvuluationModel {
  String? course;
  String? courseTitle;
  String? subjectName;
  DateTime? date;
  int? examMarkComplete;
  int? attendanceComplete;
  int? baseSchoolNameId;
  int? courseDurationId;
  int? subjectMarkId;
  int? markTypeId;
  int? courseNameId;
  int? courseModuleId;
  int? classRoutineId;
  int? courseSectionId;
  int? bnaSubjectNameId;
  int? resultSubmissionStatus;
  String? pno;
  String? name;
  dynamic? position;
  String? shortName;

  ExamEvuluationModel(
      {this.course,
        this.courseTitle,
        this.subjectName,
        this.date,
        this.examMarkComplete,
        this.attendanceComplete,
        this.baseSchoolNameId,
        this.courseDurationId,
        this.subjectMarkId,
        this.markTypeId,
        this.courseNameId,
        this.courseModuleId,
        this.classRoutineId,
        this.courseSectionId,
        this.bnaSubjectNameId,
        this.resultSubmissionStatus,
        this.pno,
        this.name,
        this.position,
        this.shortName});

  ExamEvuluationModel.fromJson(Map<String, dynamic> json) {
    course = json['course'];
    courseTitle = json['courseTitle'];
    subjectName = json['subjectName'];
    date = DateTime.parse(json["date"]);
    examMarkComplete = json['examMarkComplete'];
    attendanceComplete = json['attendanceComplete'];
    baseSchoolNameId = json['baseSchoolNameId'];
    courseDurationId = json['courseDurationId'];
    subjectMarkId = json['subjectMarkId'];
    markTypeId = json['markTypeId'];
    courseNameId = json['courseNameId'];
    courseModuleId = json['courseModuleId'];
    classRoutineId = json['classRoutineId'];
    courseSectionId = json['courseSectionId'];
    bnaSubjectNameId = json['bnaSubjectNameId'];
    resultSubmissionStatus = json['resultSubmissionStatus'];
    pno = json['pno'];
    name = json['name'];
    position = json['position'];
    shortName = json['shortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course'] = this.course;
    data['courseTitle'] = this.courseTitle;
    data['subjectName'] = this.subjectName;
    data['date'] = this.date;
    data['examMarkComplete'] = this.examMarkComplete;
    data['attendanceComplete'] = this.attendanceComplete;
    data['baseSchoolNameId'] = this.baseSchoolNameId;
    data['courseDurationId'] = this.courseDurationId;
    data['subjectMarkId'] = this.subjectMarkId;
    data['markTypeId'] = this.markTypeId;
    data['courseNameId'] = this.courseNameId;
    data['courseModuleId'] = this.courseModuleId;
    data['classRoutineId'] = this.classRoutineId;
    data['courseSectionId'] = this.courseSectionId;
    data['bnaSubjectNameId'] = this.bnaSubjectNameId;
    data['resultSubmissionStatus'] = this.resultSubmissionStatus;
    data['pno'] = this.pno;
    data['name'] = this.name;
    data['position'] = this.position;
    data['shortName'] = this.shortName;
    return data;
  }
}
