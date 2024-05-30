class GetCourseDetailModel {
  int? courseNameId;
  int? courseTypeId;
  String? course;
  String? shortName;
  String? courseSyllabus;
  Null? menuPosition;
  bool? isActive;
  Null? courseTypeName;

  GetCourseDetailModel(
      {this.courseNameId,
        this.courseTypeId,
        this.course,
        this.shortName,
        this.courseSyllabus,
        this.menuPosition,
        this.isActive,
        this.courseTypeName});

  GetCourseDetailModel.fromJson(Map<String, dynamic> json) {
    courseNameId = json['courseNameId'];
    courseTypeId = json['courseTypeId'];
    course = json['course'];
    shortName = json['shortName'];
    courseSyllabus = json['courseSyllabus'];
    menuPosition = json['menuPosition'];
    isActive = json['isActive'];
    courseTypeName = json['courseTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseNameId'] = this.courseNameId;
    data['courseTypeId'] = this.courseTypeId;
    data['course'] = this.course;
    data['shortName'] = this.shortName;
    data['courseSyllabus'] = this.courseSyllabus;
    data['menuPosition'] = this.menuPosition;
    data['isActive'] = this.isActive;
    data['courseTypeName'] = this.courseTypeName;
    return data;
  }
}
