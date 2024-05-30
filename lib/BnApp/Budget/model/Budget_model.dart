// To parse this JSON data, do
//
//     final budget = budgetFromJson(jsonString);

import 'dart:convert';

import 'package:get/state_manager.dart';

List<Budget> budgetFromJson(String str) => List<Budget>.from(json.decode(str).map((x) => Budget.fromJson(x)));

String budgetToJson(List<Budget> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Budget {
  int? budgetCodeId;
  String? budgetCodes;
  String ?name;
  dynamic ?totalBudget;
  dynamic ?availableAmount;
  dynamic ?targetAmount;
  bool ?isActive;

  Budget({
    this.budgetCodeId,
    this.budgetCodes,
    this.name,
    this.totalBudget,
    this.availableAmount,
    this.targetAmount,
    this.isActive,
  });

  factory Budget.fromJson(Map<String, dynamic> json) => Budget(
    budgetCodeId: json["budgetCodeId"],
    budgetCodes: json["budgetCodes"],
    name: json["name"],
    totalBudget: json["totalBudget"].toString(),
    availableAmount: json["availableAmount"].toString(),
    targetAmount: json["targetAmount"].toString(),
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "budgetCodeId": budgetCodeId,
    "budgetCodes": budgetCodes,
    "name": name,
    "totalBudget": totalBudget,
    "availableAmount": availableAmount,
    "targetAmount": targetAmount,
    "isActive": isActive,
  };
}
