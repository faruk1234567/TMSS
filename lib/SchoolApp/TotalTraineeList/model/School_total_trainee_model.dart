class SchoolTTraineeModel {
  int? traineeId;
  String? courseTitle;
  String? name;
  String? course;
  String? position;
  String? pno;
  String? schoolName;
  String? durationFrom;
  String? durationTo;

  SchoolTTraineeModel(
      {this.traineeId,
        this.courseTitle,
        this.name,
        this.course,
        this.position,
        this.pno,
        this.schoolName,
        this.durationFrom,
        this.durationTo});

  SchoolTTraineeModel.fromJson(Map<String, dynamic> json) {
    traineeId = json['traineeId'];
    courseTitle = json['courseTitle'];
    name = json['name'];
    course = json['course'];
    position = json['position'];
    pno = json['pno'];
    schoolName = json['schoolName'];
    durationFrom = json['durationFrom'];
    durationTo = json['durationTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['traineeId'] = this.traineeId;
    data['courseTitle'] = this.courseTitle;
    data['name'] = this.name;
    data['course'] = this.course;
    data['position'] = this.position;
    data['pno'] = this.pno;
    data['schoolName'] = this.schoolName;
    data['durationFrom'] = this.durationFrom;
    data['durationTo'] = this.durationTo;
    return data;
  }
}
