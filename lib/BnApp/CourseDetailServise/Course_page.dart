import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'Course_Controller.dart';

class CourseDetailsPage extends StatelessWidget {
  CourseDetailsPage({super.key});

  final CourseDetailController controller = Get.put(CourseDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Details",),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 10,
        titleTextStyle: TextStyle(
          fontFamily:'Roboto',
          fontSize: 40,
          color: Colors.grey,
          fontWeight: FontWeight.w700,

        ),
        backgroundColor: Colors.white, systemOverlayStyle: SystemUiOverlayStyle.dark,

      ),

      //backgroundColor: Colors.grey,



      body: Padding(
        padding: EdgeInsets.only(top: 16.0),

        child: Obx(



              () => controller.isLoading.value
              ? CircularProgressIndicator()

              : SingleChildScrollView(



            child: Column(
             // verticalDirection: VerticalDirection.down,



              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(





                    children: [

                      Text("Course Title  :    ",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                          '${controller.courseDurationDetails.value.courseName} ${controller.courseDurationDetails.value.courseTitle}',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(

                    children: [
                      Container(
                        width: 380,
                        height: 3,
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("No Of Candidates:   ",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent)),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                        controller
                            .courseDurationDetails.value.noOfCandidates!,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Container(
                      width: 380,
                      height: 3,
                      color: Colors.black26,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Duration From : ", style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent)),
                    SizedBox(
                      width: 40,),
                    Text(DateFormat.yMMMd().format(controller
                        .courseDurationDetails.value.durationFrom!,),style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Container(
                      width: 380,
                      height: 3,
                      color: Colors.black26,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Duration to : ",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent)),
                    SizedBox(
                      width: 75,),
                    Text(DateFormat.yMMMd().format(
                        controller.courseDurationDetails.value.durationTo!),style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Container(
                      width: 380,
                      height: 3,
                      color: Colors.black26,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Professional : ",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent)),
                    SizedBox(
                      width: 65,),
                    Text(
                        '${controller.courseDurationDetails.value.professional.toString()}'
                            '(week)',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Container(
                      width: 380,
                      height: 3,
                      color: Colors.black26,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("NBCD : ",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent)),
                    SizedBox(
                      width: 140,),
                    Text(
                        '${controller.courseDurationDetails.value.nbcd.toString()}'
                            '(week)',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Container(
                      width: 380,
                      height: 3,
                      color: Colors.black26,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Remarks : ",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent)),
                    SizedBox(
                      width: 140,),
                    Text(
                        '${controller.courseDurationDetails.value.remark.toString()}'
                        ,style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Container(
                      width: 380,
                      height: 3,
                      color: Colors.black26,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
