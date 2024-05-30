class TraineeNominationModel {
  String? course;
  String? courseTitle;
  String? name;
  String? position;
  int? traineeId;
  String? pno;
  dynamic courseSectionId;
  int? courseDurationId;
  int? baseSchoolNameId;
  int? totalClass;
  int? completeClass;
  int? traineeAttendance;
  int? traineeNominationId;
  int? percentage;

  TraineeNominationModel(
      {this.course,
      this.courseTitle,
      this.name,
      this.position,
      this.traineeId,
      this.pno,
      this.courseSectionId,
      this.courseDurationId,
      this.baseSchoolNameId,
      this.totalClass,
      this.completeClass,
      this.traineeAttendance,
      this.traineeNominationId,
      this.percentage});

  TraineeNominationModel.fromJson(Map<String, dynamic> json) {
    course = json['course'];
    courseTitle = json['courseTitle'];
    name = json['name'];
    position = json['position'];
    traineeId = json['traineeId'];
    pno = json['pno'];
    courseSectionId = json['courseSectionId'];
    courseDurationId = json['courseDurationId'];
    baseSchoolNameId = json['baseSchoolNameId'];
    totalClass = json['totalClass'];
    completeClass = json['completeClass'];
    traineeAttendance = json['traineeAttendance'];
    traineeNominationId = json['traineeNominationId'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course'] = course;
    data['courseTitle'] = courseTitle;
    data['name'] = name;
    data['position'] = position;
    data['traineeId'] = traineeId;
    data['pno'] = pno;
    data['courseSectionId'] = courseSectionId;
    data['courseDurationId'] = courseDurationId;
    data['baseSchoolNameId'] = baseSchoolNameId;
    data['totalClass'] = totalClass;
    data['completeClass'] = completeClass;
    data['traineeAttendance'] = traineeAttendance;
    data['traineeNominationId'] = traineeNominationId;
    data['percentage'] = percentage;
    return data;
  }
}
