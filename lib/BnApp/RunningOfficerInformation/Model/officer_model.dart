// To parse this JSON data, do
//
//     final officerModel = officerModelFromJson(jsonString);

import 'dart:convert';

List<OfficerModel> officerModelFromJson(String str) => List<OfficerModel>.from(json.decode(str).map((x) => OfficerModel.fromJson(x)));

String officerModelToJson(List<OfficerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OfficerModel {
  int? traineeId;
  String ?name;
  String ?courseTitle;
  dynamic? course;
  dynamic? position;
  String ?pno;
  SchoolName? schoolName;
  DateTime? durationFrom;
  DateTime? durationTo;

  OfficerModel({
    this.traineeId,
    this.name,
    this.courseTitle,
    this.course,
    this.position,
    this.pno,
    this.schoolName,
    this.durationFrom,
    this.durationTo,
  });

  factory OfficerModel.fromJson(Map<String, dynamic> json) => OfficerModel(
    traineeId: json["traineeId"],
    name: json["name"],
    courseTitle: json["courseTitle"],
    course: json["course"],
    position: json["position"],
    pno: json["pno"],
    schoolName: schoolNameValues.map[json["schoolName"]],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
  );

  Map<String, dynamic> toJson() => {
    "traineeId": traineeId,
    "name": name,
    "courseTitle": courseTitle,
    "course": courseValues.reverse[course],
    "position": positionValues.reverse[position],
    "pno": pno,
    "schoolName": schoolNameValues.reverse[schoolName],
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
  };
}

enum Course {
  BASIC_DIVING_SALVAGE_CD_III_Q_COURSE,
  C_802_A_MISSILE_SSM,
  JUNIOR_STAFF_COURSE,
  LONG_G,
  PRE_COMMISSION_TRG,
  PWO_N_COURSE_PHASE_I
}

final courseValues = EnumValues({
  "Basic Diving & Salvage (CD-III) ‘Q’ Course  ": Course.BASIC_DIVING_SALVAGE_CD_III_Q_COURSE,
  "C-802 A Missile (SSM)": Course.C_802_A_MISSILE_SSM,
  "Junior Staff Course": Course.JUNIOR_STAFF_COURSE,
  "Long G": Course.LONG_G,
  "Pre-Commission Trg": Course.PRE_COMMISSION_TRG,
  "PWO (N) Course (Phase-I) ": Course.PWO_N_COURSE_PHASE_I
});

enum Position {
  AG_LT,
  AG_LT_CDR,
  AG_SUB_LT,
  CDR,
  LT,
  LT_CDR,
  SUB_LT
}

final positionValues = EnumValues({
  "Ag Lt": Position.AG_LT,
  "Ag Lt Cdr": Position.AG_LT_CDR,
  "Ag Sub Lt": Position.AG_SUB_LT,
  "Cdr": Position.CDR,
  "Lt": Position.LT,
  "Lt Cdr": Position.LT_CDR,
  "Sub Lt": Position.SUB_LT
});

enum SchoolName {
  BNA_TRG_WING,
  DIVING_SALVAGE_SCHOOL,
  JUNIOR_STAFF_TRAINING_INSTITUTE,
  ND_SCHOOL,
  ULKA_TRAINING_SCHOOL
}

final schoolNameValues = EnumValues({
  "BNA Trg Wing": SchoolName.BNA_TRG_WING,
  "Diving & Salvage School": SchoolName.DIVING_SALVAGE_SCHOOL,
  "Junior Staff Training Institute": SchoolName.JUNIOR_STAFF_TRAINING_INSTITUTE,
  "ND School": SchoolName.ND_SCHOOL,
  "ULKA Training School": SchoolName.ULKA_TRAINING_SCHOOL
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
