// To parse this JSON data, do
//
//     final courseByNamedIdModel = courseByNamedIdModelFromJson(jsonString);

import 'dart:convert';

CourseByNamedIdModel courseByNamedIdModelFromJson(String str) => CourseByNamedIdModel.fromJson(json.decode(str));

String courseByNamedIdModelToJson(CourseByNamedIdModel data) => json.encode(data.toJson());

class CourseByNamedIdModel {
    int ?courseNameId;
    int? courseTypeId;
    String ?course;
    String ?shortName;
    dynamic courseSyllabus;
    dynamic menuPosition;
    bool? isActive;
    dynamic courseTypeName;

    CourseByNamedIdModel({
        this.courseNameId,
        this.courseTypeId,
        this.course,
        this.shortName,
        this.courseSyllabus,
        this.menuPosition,
        this.isActive,
        this.courseTypeName,
    });

    factory CourseByNamedIdModel.fromJson(Map<String, dynamic> json) => CourseByNamedIdModel(
        courseNameId: json["courseNameId"],
        courseTypeId: json["courseTypeId"],
        course: json["course"],
        shortName: json["shortName"],
        courseSyllabus: json["courseSyllabus"],
        menuPosition: json["menuPosition"],
        isActive: json["isActive"],
        courseTypeName: json["courseTypeName"],
    );

    Map<String, dynamic> toJson() => {
        "courseNameId": courseNameId,
        "courseTypeId": courseTypeId,
        "course": course,
        "shortName": shortName,
        "courseSyllabus": courseSyllabus,
        "menuPosition": menuPosition,
        "isActive": isActive,
        "courseTypeName": courseTypeName,
    };
}
