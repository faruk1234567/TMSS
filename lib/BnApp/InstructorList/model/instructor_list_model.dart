// To parse this JSON data, do
//
//     final instructorModel = instructorModelFromJson(jsonString);

import 'dart:convert';

List<InstructorModel> instructorModelFromJson(String str) => List<InstructorModel>.from(json.decode(str).map((x) => InstructorModel.fromJson(x)));

String instructorModelToJson(List<InstructorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InstructorModel {
    int? courseInstructorId;
    int? traineeId;
    String ?name;
    String? pno;
    String? shortCode;
    String ?position;
    String ?subjectName;
    String? shortName;
    String? subjectCode;
    dynamic shortCode1;
    String ?schoolName;
    String ?course;
    String ?courseTitle;
    DateTime? durationFrom;
    DateTime? durationTo;
    String? subjectShortName;

    InstructorModel({
        this.courseInstructorId,
        this.traineeId,
        this.name,
        this.pno,
        this.shortCode,
        this.position,
        this.subjectName,
        this.shortName,
        this.subjectCode,
        this.shortCode1,
        this.schoolName,
        this.course,
        this.courseTitle,
        this.durationFrom,
        this.durationTo,
        this.subjectShortName,
    });

    factory InstructorModel.fromJson(Map<String, dynamic> json) => InstructorModel(
        courseInstructorId: json["courseInstructorId"],
        traineeId: json["traineeId"],
        name: json["name"],
        pno: json["pno"],
        shortCode: json["shortCode"],
        position: json["position"],
        subjectName: json["subjectName"],
        shortName: json["shortName"],
        subjectCode: json["subjectCode"],
        shortCode1: json["shortCode1"],
        schoolName: json["schoolName"],
        course: json["course"],
        courseTitle: json["courseTitle"],
        durationFrom: DateTime.parse(json["durationFrom"]),
        durationTo: DateTime.parse(json["durationTo"]),
        subjectShortName: json["subjectShortName"],
    );

    Map<String, dynamic> toJson() => {
        "courseInstructorId": courseInstructorId,
        "traineeId": traineeId,
        "name": name,
        "pno": pno,
        "shortCode": shortCode,
        "position": position,
        "subjectName": subjectName,
        "shortName": shortName,
        "subjectCode": subjectCode,
        "shortCode1": shortCode1,
        "schoolName": schoolName,
        "course": course,
        "courseTitle": courseTitle,
        "durationFrom": durationFrom?.toIso8601String(),
        "durationTo": durationTo?.toIso8601String(),
        "subjectShortName": subjectShortName,
    };
}
