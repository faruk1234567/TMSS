import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;

import '../controller/trainee_bio_controller.dart';

class TraineeBioDataScreen extends StatefulWidget {
  TraineeBioDataScreen({super.key});

  @override
  State<TraineeBioDataScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<TraineeBioDataScreen>
    implements WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final trineeBioDataListController tbc =
      Get.put(trineeBioDataListController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "BN JUNIOR STAFF COURSE".toUpperCase(),
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 2,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "BIO-DATA OF STUDENT OFFICER".toUpperCase(),
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 2,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text('1.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'P NO ',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${tbc.trblist[0].pno}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text('Rank ', style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 8,
                        ),
                        Text('${tbc.trblist[0].rankPosition}',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 30,
                        ),
                        Text('SENIORITY ', style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                            '${tbc.trblist[0].seniority}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].seniority}',
                            style: TextStyle(fontSize: 20)),
                        Container(
                          width: 150,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('2.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('FullName', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text('${tbc.trblist[0].name}'.toUpperCase(),
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 600,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            '                            (Under line as you are known)')
                      ],
                    ),
                    Row(
                      children: [
                        Text('3.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('DATE OF COMMISSION',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          intl.DateFormat.yMMMd()
                              .format(tbc.trblist[0].dateOfCommission!),
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 1.5,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                        Text('Branch', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${tbc.trblist[0].branchName}'.toUpperCase(),
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 600,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text('4.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('DATE OF BIRTH', style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          intl.DateFormat.yMMMd()
                              .format(tbc.trblist[0].dateOfBirth!),
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 1.5,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                        Text('PLACE', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text('5.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('PHYSICAL DESCRIPTION',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                decorationThickness: 2,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'a.',
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Height',
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text('${tbc.trblist[0].heightName}'.toUpperCase(),
                            style: TextStyle(fontSize: 20)),
                        Container(
                          width: 140,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'b.',
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Weight',
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text('${tbc.trblist[0].weightName}'.toUpperCase(),
                                style: TextStyle(fontSize: 20)),
                            Container(
                              width: 100,
                              height: 1.5,
                              color: Colors.black26,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'c.',
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'BLOOD GROUP',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text('${tbc.trblist[0].bloodGroupName}'.toUpperCase(),
                            style: TextStyle(fontSize: 20)),
                        Container(
                          width: 80,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 60,
                            ),
                            Text(
                              'd.',
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'MEDICAL CATEGORY',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                                '${tbc.trblist[0].medicalCategory}'
                                            .toString() ==
                                        "null"
                                    ? ""
                                    : '${tbc.trblist[0].medicalCategory}',
                                style: TextStyle(fontSize: 20)),
                            Container(
                              width: 30,
                              height: 1.5,
                              color: Colors.black26,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 1.5,
                                  color: Colors.black26,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          // alignment: Alignment.centerRight,
                          width: 200,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text('6.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('RELIGION',
                            style: TextStyle(
                                decorationColor: Colors.black,
                                decorationThickness: 2,
                                fontSize: 18,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${tbc.trblist[0].religionName}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          // alignment: Alignment.centerRight,
                          width: 400,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text('7.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('MARITIAL STATUS(Married/Single)',
                            style: TextStyle(
                                decorationColor: Colors.black,
                                decorationThickness: 2,
                                fontSize: 18,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${tbc.trblist[0].maritalStatusName}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          // alignment: Alignment.centerRight,
                          width: 10,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Date',
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                                '${tbc.trblist[0].marriedDate}'.toString() ==
                                        "null"
                                    ? ""
                                    : '${tbc.trblist[0].marriedDate}',
                                style: TextStyle(fontSize: 20)),
                            Container(
                              width: 10,
                              height: 1.5,
                              color: Colors.black26,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'a.',
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'FAMILY LOCATION',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                            '${tbc.trblist[0].familyLocation}'.toString() ==
                                    "null"
                                ? ""
                                : '${tbc.trblist[0].familyLocation}',
                            style: TextStyle(fontSize: 20)),
                        Container(
                          width: 250,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'b.',
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'NAME OF WIFE',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                            '${tbc.trblist[0].wifeName}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].wifeName}',
                            style: TextStyle(fontSize: 20)),
                        Container(
                          width: 250,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'c.',
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'CHILDREN :-------',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                        ),


                        Text(
                          'S NO',
                          style: TextStyle(decoration: TextDecoration.underline,
                              decorationColor: Colors.black,
                              decorationThickness: 2,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),


                            Text(
                              'Name',
                              style: TextStyle(decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 90,
                            ),


                            Text(
                              'SEX(M/F)',
                              style: TextStyle(decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 60,
                            ),


                            Text(
                              'AGE',
                              style: TextStyle(decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('8.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('FATHER',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 18,

                                color: Colors.black)),
                        SizedBox(width: 10,),
                        Text(
                            '${tbc.trblist[0].fatherName}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].fatherName}',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 400,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('9.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('OCCUPATION',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 18,

                                color: Colors.black)),
                        SizedBox(width: 10,),
                        Text(
                            '${tbc.trblist[0].fatherOccupation}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].fatherOccupation}',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 400,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('10.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('MOTHER',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 18,

                                color: Colors.black)),
                        SizedBox(width: 10,),
                        Text(
                            '${tbc.trblist[0].motherName}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].motherName}',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 400,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('11.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('PRESENT ADDRESS (WITH TEL)',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 15,

                                color: Colors.black)),
                        SizedBox(width: 10,),
                        Text(
                            '${tbc.trblist[0].presentAddress}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].presentAddress}',
                            style: TextStyle(fontSize: 15)),
                        SizedBox(
                          width: 30,
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('12.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('PERMANENT ADDRESS (WITH TEL)',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 15,

                                color: Colors.black)),
                        SizedBox(width: 10,),
                        Text(
                            '${tbc.trblist[0].permanentAddress}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].permanentAddress}',
                            style: TextStyle(fontSize: 15)),
                        SizedBox(
                          width: 30,
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('13.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('TRUST BANK ACCOUNT NUMBER WITH NAME AND BRANCH (FOR DEPOSITING IRP BILL))',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 15,

                                color: Colors.black)),
                      /*  SizedBox(width: 10,),
                        Text(
                            '${tbc.trblist[0].permanentAddress}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].permanentAddress}',
                            style: TextStyle(fontSize: 15)),
                        SizedBox(
                          width: 30,
                        ),*/

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('14.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('PERSON TO BE COMMUNICATED IN EMERGENCY WITH ADDRESS',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 15,

                                color: Colors.black)),
                        /*SizedBox(width: 10,),
                        Text(
                            '${tbc.trblist[0].permanentAddress}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].permanentAddress}',
                            style: TextStyle(fontSize: 15)),
                        SizedBox(
                          width: 30,
                        ),*/

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('15.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('BROTHERS/SISTERS (with occupation)',
                            style: TextStyle(

                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                decorationThickness: 2,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(width: 20,),
                        Container(
                          width: 300,
                          height: 1.5,
                          color: Colors.black26,
                        ),




                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('16.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('SPORTS',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 18,

                                color: Colors.black)),
                        SizedBox(width: 10,),
                        Text(
                            '${tbc.trblist[0].sports}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].sports}',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 550,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('17.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('HOBBIES',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 18,

                                color: Colors.black)),
                        SizedBox(width: 10,),
                        Text(
                            '${tbc.trblist[0].hobbies}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].hobbies}',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 550,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('18.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('LIKENESS',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 18,

                                color: Colors.black)),
                        SizedBox(width: 10,),
                        Text(
                            '${tbc.trblist[0].likeness}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].likeness}',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 550,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('19.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('DISLIKENESS',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 18,

                                color: Colors.black)),
                        SizedBox(width: 10,),
                        Text(
                            '${tbc.trblist[0].dislikeness}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].dislikeness}',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 550,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('20.'),
                        SizedBox(
                          width: 2,
                        ),
                        Text('COUNTRY VISITED',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 18,

                                color: Colors.black)),
                        SizedBox(width: 10,),
                        Text(
                            '${tbc.trblist[0].countryVisited}'.toString() == "null"
                                ? ""
                                : '${tbc.trblist[0].countryVisited}',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 450,
                          height: 1.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [

                        Text('NOTE : SUBMIT TO TCO JSTI ON THE FIRST DAY OF THE COURSE',
                            style: TextStyle(

                                decorationColor: Colors.black,

                                fontSize: 18,

                                color: Colors.black)),




                      ],
                    ),
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          width: 200,
                          height: 1.5,
                          color: Colors.black26,
                        )



                      ],
                    ),
                   // SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                       'SIGNATURE OF OFFICER',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        )



                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          'Date',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                       /* Container(
                          width: 150,
                          height: 1.5,
                          color: Colors.black26,
                        )*/
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Container(
                              width: 150,
                              height: 1.5,
                              color: Colors.black26,
                            )



                          ],
                        ),



                      ],
                    ),









                  ],
                ),
                // SizedBox(height: 200,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeAccessibilityFeatures() {
    // TODO: implement didChangeAccessibilityFeatures
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    // TODO: implement didChangeLocales
  }

  @override
  void didChangeMetrics() {
    // TODO: implement didChangeMetrics
  }

  @override
  void didChangePlatformBrightness() {
    // TODO: implement didChangePlatformBrightness
  }

  @override
  void didChangeTextScaleFactor() {
    // TODO: implement didChangeTextScaleFactor
  }

  @override
  void didHaveMemoryPressure() {
    // TODO: implement didHaveMemoryPressure
  }

  @override
  Future<bool> didPopRoute() {
    // TODO: implement didPopRoute
    throw UnimplementedError();
  }

  @override
  Future<bool> didPushRoute(String route) {
    // TODO: implement didPushRoute
    throw UnimplementedError();
  }

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    // TODO: implement didPushRouteInformation
    throw UnimplementedError();
  }

  @override
  Future<AppExitResponse> didRequestAppExit() {
    // TODO: implement didRequestAppExit
    throw UnimplementedError();
  }
}
