import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../controller/Total_trainee_controller.dart';
import 'School_course_TotalTrainee_list.dart';

class SchoolCourseListScreen extends StatefulWidget {
  const SchoolCourseListScreen({super.key});

  @override
  State<SchoolCourseListScreen> createState() => _BnDataSchoolsScreenState();
}

class _BnDataSchoolsScreenState extends State<SchoolCourseListScreen> {
  final SchoolTotalTraineeController controller = Get.put(SchoolTotalTraineeController());

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(controller.uniqueCourses.length);
    return PopScope(
      onPopInvoked: (_) => controller.searchList.clear(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("School Trainee CourseList", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
        ),
        body: Column(
          children: [
            /*SizedBox(
              height: 60,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 100),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoSearchTextField(
                onChanged: (value) {
                  setState(() {
                    controller.search(value);
                  }); // Call search function in the controller
                },
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: controller.searchList.isEmpty ? controller.uniqueCourses.length : controller.searchList.length,
                itemBuilder: (context, index) {
                  // final course=controller.uniqueCourses[index]['course'];
                  //final courseTitle=controller.uniqueCourses[index]['courseTitle'];
                  //final displayText='$course $courseTitle';
                  final course = controller.searchList.isEmpty ? controller.uniqueCourses[index] : controller.searchList[index];
      
                  return InkWell(
                    onTap: () {
                      Get.to(() => SchoolTotalTraineeDataSearch(course: controller.uniqueCourses[index]));
                    },
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue.shade900,
                        boxShadow: const [
                          BoxShadow(color: Colors.white54, blurRadius: 2, offset: Offset(0, 2)),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaler: const TextScaler.linear(1),
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .65,
                            child: Text(
                              course,
                              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                              textScaler: const TextScaler.linear(1),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}