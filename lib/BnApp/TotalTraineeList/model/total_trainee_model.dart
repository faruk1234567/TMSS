// To parse this JSON data, do
//
//     final totalTraineeModel = totalTraineeModelFromJson(jsonString);

import 'dart:convert';

List<TotalTraineeModel> totalTraineeModelFromJson(String str) => List<TotalTraineeModel>.from(json.decode(str).map((x) => TotalTraineeModel.fromJson(x)));

String totalTraineeModelToJson(List<TotalTraineeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TotalTraineeModel {
  int ?traineeId;
  String ?courseTitle;
  String? name;
  String? course;
  String ?position;
  String? pno;
  SchoolName ?schoolName;
  DateTime? durationFrom;
  DateTime ?durationTo;

  TotalTraineeModel({
    this.traineeId,
    this.courseTitle,
    this.name,
    this.course,
    this.position,
    this.pno,
    this.schoolName,
    this.durationFrom,
    this.durationTo,
  });

  factory TotalTraineeModel.fromJson(Map<String, dynamic> json) => TotalTraineeModel(
    traineeId: json["traineeId"],
    courseTitle: json["courseTitle"],
    name: json["name"],
    course: json["course"],
    position: json["position"],
    pno: json["pno"],
    schoolName: schoolNameValues.map[json["schoolName"]],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
  );

  Map<String, dynamic> toJson() => {
    "traineeId": traineeId,
    "courseTitle": courseTitle,
    "name": name,
    "course": course,
    "position": position,
    "pno": pno,
    "schoolName": schoolNameValues.reverse[schoolName],
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
  };
}

enum SchoolName {
  BNA_TRG_WING,
  BN_HYDROGRAPHIC_SCHOOL,
  DIVING_SALVAGE_SCHOOL,
  DOMESTIC_SAILOR_TRAINING_WING,
  ENGINEERING_SCHOOL,
  GUNNERY_SCHOOL,
  JCO_S_TRAINING_INSTITURE,
  JUNIOR_STAFF_TRAINING_INSTITUTE,
  MEDICAL_ASSISTANT_TRAINING_SCHOOL,
  MUSIC_SCHOOL,
  ND_SCHOOL,
  ORDNANCE_SCHOOL,
  PROVOST_AND_LAW_SCHOOL,
  SIGNAL_SCHOOL,
  S_S_SAILOR_TRAINING_WING,
  TAS_SCHOOL,
  ULKA_TRAINING_SCHOOL
}

final schoolNameValues = EnumValues({
  "BNA Trg Wing": SchoolName.BNA_TRG_WING,
  "BN Hydrographic School": SchoolName.BN_HYDROGRAPHIC_SCHOOL,
  "Diving & Salvage School": SchoolName.DIVING_SALVAGE_SCHOOL,
  "Domestic Sailor Training Wing": SchoolName.DOMESTIC_SAILOR_TRAINING_WING,
  "Engineering School ": SchoolName.ENGINEERING_SCHOOL,
  "Gunnery School": SchoolName.GUNNERY_SCHOOL,
  "JCO's Training Institure": SchoolName.JCO_S_TRAINING_INSTITURE,
  "Junior Staff Training Institute": SchoolName.JUNIOR_STAFF_TRAINING_INSTITUTE,
  "Medical Assistant Training School": SchoolName.MEDICAL_ASSISTANT_TRAINING_SCHOOL,
  "Music School": SchoolName.MUSIC_SCHOOL,
  "ND School": SchoolName.ND_SCHOOL,
  "Ordnance School": SchoolName.ORDNANCE_SCHOOL,
  "Provost and Law School": SchoolName.PROVOST_AND_LAW_SCHOOL,
  "Signal School": SchoolName.SIGNAL_SCHOOL,
  "S&S Sailor Training Wing": SchoolName.S_S_SAILOR_TRAINING_WING,
  "TAS School": SchoolName.TAS_SCHOOL,
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
