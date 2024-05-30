// To parse this JSON data, do
//
//     final traineeAttendenseModel = traineeAttendenseModelFromJson(jsonString);

import 'dart:convert';

List<TraineeAttendenseModel> traineeAttendenseModelFromJson(String str) => List<TraineeAttendenseModel>.from(json.decode(str).map((x) => TraineeAttendenseModel.fromJson(x)));

String traineeAttendenseModelToJson(List<TraineeAttendenseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TraineeAttendenseModel {
  Name? name;
  Pno ?pno;
  dynamic traineeRank;
  String ?course;
  String? courseTitle;
  String? periodName;
  String? subjectName;
  String? shortName;
  DateTime? date;
  DateTime ?attendanceDate;
  bool? attendanceStatus;
  String? attendanceRemarksCause;
  String? classTypeName;

  TraineeAttendenseModel({
    this.name,
    this.pno,
    this.traineeRank,
    this.course,
    this.courseTitle,
    this.periodName,
    this.subjectName,
    this.shortName,
    this.date,
    this.attendanceDate,
    this.attendanceStatus,
    this.attendanceRemarksCause,
    this.classTypeName,
  });

  factory TraineeAttendenseModel.fromJson(Map<String, dynamic> json) => TraineeAttendenseModel(
    name: nameValues.map[json["name"]],
    pno: pnoValues.map[json["pno"]],
    traineeRank: json["traineeRank"],
    course: json["course"],
    courseTitle: json["courseTitle"],
    periodName: json["periodName"],
    subjectName: json["subjectName"],
    shortName: json["shortName"],
    date: DateTime.parse(json["date"]),
    attendanceDate: DateTime.parse(json["attendanceDate"]),
    attendanceStatus: json["attendanceStatus"],
    attendanceRemarksCause: json["attendanceRemarksCause"],
    classTypeName: json["classTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "pno": pnoValues.reverse[pno],
    "traineeRank": traineeRank,
    "course": courseValues.reverse[course],
    "courseTitle": courseTitleValues.reverse[courseTitle],
    "periodName": periodNameValues.reverse[periodName],
    "subjectName": subjectNameValues.reverse[subjectName],
    "shortName": shortNameValues.reverse[shortName],
    "date": date?.toIso8601String(),
    "attendanceDate": attendanceDate?.toIso8601String(),
    "attendanceStatus": attendanceStatus,
    "attendanceRemarksCause": attendanceRemarksCauseValues.reverse[attendanceRemarksCause],
    "classTypeName": classTypeNameValues.reverse[classTypeName],
  };
}

enum AttendanceRemarksCause {
  OTHERS,
  PPGF
}

final attendanceRemarksCauseValues = EnumValues({
  "Others": AttendanceRemarksCause.OTHERS,
  "PPGF": AttendanceRemarksCause.PPGF
});

enum ClassTypeName {
  CLASS,
  EXAM,
  GOVT_HOLIDAY,
  POOL_ACTIVITIES,
  PRACTICAL,
  PRACTICAL_DIVING
}

final classTypeNameValues = EnumValues({
  "Class": ClassTypeName.CLASS,
  "Exam": ClassTypeName.EXAM,
  "Govt. Holiday": ClassTypeName.GOVT_HOLIDAY,
  "Pool Activities": ClassTypeName.POOL_ACTIVITIES,
  "Practical": ClassTypeName.PRACTICAL,
  "Practical Diving": ClassTypeName.PRACTICAL_DIVING
});

enum Course {
  BASIC_DIVING_SALVAGE_CD_III_Q_COURSE
}

final courseValues = EnumValues({
  "Basic Diving & Salvage (CD-III) ‘Q’ Course  ": Course.BASIC_DIVING_SALVAGE_CD_III_Q_COURSE
});

enum CourseTitle {
  THE_2023_B
}

final courseTitleValues = EnumValues({
  "2023/B": CourseTitle.THE_2023_B
});

enum Name {
  CHIKOTA_SHADRICK
}

final nameValues = EnumValues({
  "CHIKOTA SHADRICK": Name.CHIKOTA_SHADRICK
});

enum PeriodName {
  THE_1_ST,
  THE_2_ND,
  THE_3_RD,
  THE_4_TH,
  THE_5_TH,
  THE_6_TH
}

final periodNameValues = EnumValues({
  "1st": PeriodName.THE_1_ST,
  "2nd": PeriodName.THE_2_ND,
  "3rd": PeriodName.THE_3_RD,
  "4th": PeriodName.THE_4_TH,
  "5th": PeriodName.THE_5_TH,
  "6th": PeriodName.THE_6_TH
});

enum Pno {
  ZAM_104959
}

final pnoValues = EnumValues({
  " Zam-104959": Pno.ZAM_104959
});

enum ShortName {
  P,
  T
}

final shortNameValues = EnumValues({
  "P": ShortName.P,
  "T": ShortName.T
});

enum SubjectName {
  ADMIN_ORG,
  AIR_DIVING_OPEN_CIRCUIT_SCUBA,
  DIVING_MEDICINE,
  DIVING_PHYSICS,
  OXYGEN,
  PHYSICAL_PHASE,
  SALVAGE_WORK,
  SHIPS_BOTTOM_SEABED_SEARCH,
  SWIMMING_POOL_ACTIVITIES_INCLUDING_LIFE_SAVING
}

final subjectNameValues = EnumValues({
  "Admin & Org": SubjectName.ADMIN_ORG,
  "Air Diving (Open Circuit SCUBA)": SubjectName.AIR_DIVING_OPEN_CIRCUIT_SCUBA,
  "Diving Medicine": SubjectName.DIVING_MEDICINE,
  "Diving Physics": SubjectName.DIVING_PHYSICS,
  "Oxygen": SubjectName.OXYGEN,
  "Physical Phase": SubjectName.PHYSICAL_PHASE,
  "Salvage Work": SubjectName.SALVAGE_WORK,
  "Ships Bottom & Seabed Search": SubjectName.SHIPS_BOTTOM_SEABED_SEARCH,
  "Swimming Pool Activities including life saving ": SubjectName.SWIMMING_POOL_ACTIVITIES_INCLUDING_LIFE_SAVING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
