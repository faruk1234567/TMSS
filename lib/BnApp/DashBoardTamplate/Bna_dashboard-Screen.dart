import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:navy_project/BnApp/DashBoardTamplate/bn_data_schools_screen.dart';

import '../../SchoolApp/CourseInstructor/InstructorList/view/course_instructor_list_view.dart';
import '../../SchoolApp/CourseInstructor/controller/course_instructor_controller.dart';
import '../../SchoolApp/CourseInstructor/views/Course_instructor_view.dart';
import '../../SchoolApp/ExamEvaluationList/controller/Exam_evuluation_controller.dart';
import '../../SchoolApp/ExamEvaluationList/view/exam_evuluation_views.dart';
import '../../SchoolApp/ExamList/controller/SExam_controller.dart';
import '../../SchoolApp/ExamList/view/Exam_status_view.dart';
import '../../SchoolApp/OfficersList/controller/School_officer_controller.dart';
import '../../SchoolApp/OfficersList/view/school_officer_view.dart';
import '../../SchoolApp/OfficersList/view/school_officers_totalTrainee.dart';
import '../../SchoolApp/PrecourseMaterialList/controller/precourse_material_controller.dart';
import '../../SchoolApp/PrecourseMaterialList/view/precourse_view.dart';
import '../../SchoolApp/ReadingMaterialUpload/controller/reading_material_controller.dart';
import '../../SchoolApp/ReadingMaterialUpload/view/reading_material_view.dart';
import '../../SchoolApp/RoutineNoteList/controller/School_rutine_controller.dart';
import '../../SchoolApp/RoutineNoteList/view/School_rutine_view.dart';
import '../../SchoolApp/Sailors/controller/sailors_controller.dart';
import '../../SchoolApp/Sailors/view/sailors_officer_view.dart';
import '../../SchoolApp/SchoolNotice/controller/School_notice_controller.dart';
import '../../SchoolApp/SchoolNotice/view/school_notice_views.dart';
import '../../SchoolApp/TotalTraineeList/controller/Total_trainee_controller.dart';
import '../../SchoolApp/TotalTraineeList/views/School_course_list.dart';
import '../../SchoolApp/WeeklyPrograme/view/School_weekly_list_views.dart';
import '../../SchoolApp/courseList/controller/Course_named_controller.dart';
import '../../SchoolApp/courseList/views/Course_list_view.dart';
import '../../api/Bn_AppRoutes.dart';
import '../../api/storage.dart';
import '../Budget/Views/Budget_views.dart';
import '../ForeignTraineeList/controller/foreign_trainee_controller.dart';
import '../ForeignTraineeList/view/Foreign_trainee_list.dart';
import '../GetCourseCountryBySchool/views/bn_data_school_By_course__screen.dart';
import '../GetCourseNamedBySchool/views/bn_data_school_named_school_screen.dart';
import '../InterServiseCourse/View/InterServisePage.dart';
import '../JcosExamList/views/Jco_page.dart';
import '../LoginService/login_Screen.dart';
import '../QExam/View/qExam_page.dart';
import '../RunningForeignCourse/Views/foreign_course_page.dart';
import '../RunningOfficerInformation/controller/officer_controller.dart';
import '../RunningOfficerInformation/view/Officer_Course_list.dart';
import '../SailorsInformation/controller/sailors_controller.dart';
import '../SailorsInformation/view/sailors_course_list.dart';
import '../StafCollegeExam/Views/Staff_college_view_page.dart';
import '../TotalTraineeList/controller/Total_trainee_controller.dart';
import '../TotalTraineeList/views/Course_list.dart';
import 'Bn_DataSearch.dart';

class BnaDashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SchoolTotalTraineeController schoolTotalTraineeController =
        Get.put(SchoolTotalTraineeController());
    final SchoolOfficersTraineeController schoolOfficersTraineeController =
        Get.put(SchoolOfficersTraineeController());
    final SailorOfficersTraineeController sailorOfficersTraineeController =
        Get.put(SailorOfficersTraineeController());
    final TotalTraineeController totalTraineeController =
        Get.put(TotalTraineeController());
    final TotalOfficerController totalOfficerController =
        Get.put(TotalOfficerController());
    final TotalSailorController totalSailorController =
        Get.put(TotalSailorController());
    final ForeignTrainingController foreignTrainingController =
        Get.put(ForeignTrainingController());
    final CourseInstructorController courseInstructorController =
        Get.put(CourseInstructorController());
    final SchoolNoticeController schoolNoticeController =
        Get.put(SchoolNoticeController());
    final ExamEvuluationController examEvuluationController =
        Get.put(ExamEvuluationController());
    final PrecourseController precourseController =
        Get.put(PrecourseController());
    final CourseNamedController courseNamedController =
        Get.put(CourseNamedController());
    final SchoolExamController schoolExamController =
        Get.put(SchoolExamController());
    final SchoolRutineController schoolRutineController=Get.put(SchoolRutineController());
    final SchoolReadingMaterialController schoolReadingMaterialController = Get.put(SchoolReadingMaterialController());
    void logout() {
      storage.write('token', null);
      Get.offNamedUntil(AppRoutes.login, (route) => false);
    }

    void GoBack() {
      Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => SchoolCourseListScreen()));
    }

    void GoOfficerInDetail() {
      Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => SchoolOfficersListScreen()));
    }

    void GoSailorInDetail() {
      Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => SailorOfficersListScreen()));
    }

    void GoForeignInDetail() {
      Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => ForeignCourseListScreen()));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /// resizeToAvoidBottomInset: false,

        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('Welcome TMS School Dashbord',
              style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  logout();
                },
                child: Tooltip(
                    message: "Course Details",
                    textStyle: const TextStyle(color: Colors.red),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: Colors.white,
                        height: 60,
                        child: Image.asset(
                          'images/logout1.jpg',
                        ),
                      ),
                    )))
          ],
        ),

        body: ListView(
          //padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                // alignment: Alignment.centerLeft,

                //height: MediaQuery.of(context).size.height / 2.22,
                width: MediaQuery.of(context).size.width / 2.62,
                /*decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50))),*/
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Total Trainee",
                            style:
                                (TextStyle(color: Colors.black, fontSize: 24)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              GoBack();
                            },
                            child: Obx(
                              () => Text(
                                '${schoolTotalTraineeController.SchoolDataList.length}',
                                style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontSize: 35,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .98,
                          height: 2,
                          color: Colors.black26,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Officers",
                            style:
                                (TextStyle(color: Colors.black, fontSize: 24)),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              GoOfficerInDetail();
                            },
                            child: Obx(
                              () => Text(
                                '${schoolOfficersTraineeController.SchoolOfficersDataList.length}',
                                style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontSize: 35,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .98,
                          height: 2,
                          color: Colors.black26,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Sailors",
                            style:
                                (TextStyle(color: Colors.black, fontSize: 24)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              GoSailorInDetail();
                            },
                            child: Obx(
                              () => Text(
                                '${sailorOfficersTraineeController.SalorsOfficersDataList.length}',
                                style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontSize: 35,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .98,
                          height: 2,
                          color: Colors.black26,
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Civil",
                            style:
                                (TextStyle(color: Colors.black, fontSize: 24)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "0",
                            style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 35,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .98,
                          height: 2,
                          color: Colors.black26,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Foreign Trainee",
                            style:
                                (TextStyle(color: Colors.black, fontSize: 24)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "0",
                            style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 35,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 4,
                  color: Colors.blue,
                )
              ],
            ),
            Container(
              child: Container(
                color: Colors.indigo,
                // padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.85,
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  children: [
                    _buildCard(context, 'Running\nCourse', Icons.people,
                        onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BnDataSchoolsScreen()));
                    }),
                    _buildCard(context, 'Passing\nOut', Icons.school,
                        onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForeignRunnungCourses()));
                    }),
                    _buildCard(context, 'UpComing', Icons.class_,
                        onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InterServiseCourses()));
                    }),
                    _buildCard(context, 'Weekly\nProgram', Icons.check_circle,
                        onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SchoolWeeklyListViews()));
                    }),
                    _buildCard(context, 'Notice \nBoard', Icons.assignment,
                        onPressed: () async {
                      await schoolNoticeController.getSchoolDetailData(
                          bSchoolId: storage.read('branchId'));
                      await schoolNoticeController
                          .getSchoolNoticeList()
                          .then((_) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SchoolNoticeViews()));
                      });
                    }),
                    _buildCard(context, 'Attendance', Icons.people,
                        onPressed: () {
                      /*Navigator.push(context, MaterialPageRoute(builder: (context)=>StafCollegePage()));*/
                    }),
                    _buildCard(context, 'Course\nInstructor', Icons.class_,
                        onPressed: () async {
                      await courseInstructorController.getSchoolDetailData(
                          bSchoolId: storage.read('branchId'));
                      await courseInstructorController
                          .getSchoolCInstructorList()
                          .then((_) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SchoolCourseInstructorViews()));
                      });
                    }),
                    _buildCard(context, 'Exam\nEvaluation', Icons.check_circle,
                        onPressed: () async {
                      await examEvuluationController.getSchoolDetailData(
                          bSchoolId: storage.read('branchId'));
                      await examEvuluationController
                          .getExamEvuluationData()
                          .then((_) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExamEvuluationViews()));
                      });
                    }),
                    _buildCard(context, 'Precourse\nMaterial', Icons.assignment,
                        onPressed: () async {
                      await precourseController.getSchoolDetailData(
                          bSchoolId: storage.read('branchId'));
                      await precourseController
                          .getPreCourseListData()
                          .then((_) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrecourseListView()));
                      });
                    }),
                    _buildCard(context, 'Reading\nMaterial', Icons.school,
                        onPressed: () {
                      /* Navigator.push(context, MaterialPageRoute(builder: (context)=>getNamedBySchool()))*/;
                    }),
                    _buildCard(context, 'Course\nNames', Icons.assignment,
                        onPressed: () async {
                      await courseNamedController.getSchoolDetailData(
                          bSchoolId: storage.read('branchId'));
                      await courseNamedController.getCourseListData().then((_) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CourseNamedBySchool()));
                      });
                    }),
                    _buildCard(context, 'Exam List', Icons.school,
                        onPressed: () async {
                      await schoolExamController.getSchoolDetailData(
                          bSchoolId: storage.read('branchId'));
                      await schoolExamController
                          .getSchSchoolExamList()
                          .then((_) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SchoolExamListViews()));
                      });
                    }),
                    _buildCard(context, 'Routine Note', Icons.school,
                        onPressed: () async {
                          await schoolRutineController.getSchoolDetailData(
                              bSchoolId: storage.read('branchId'));
                          await schoolRutineController
                              .getSchoolRutineData()
                              .then((_) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SchoolRutineViewPage()));
                          });
                        }),
                    _buildCard(context, 'Reading Material\n Upload', Icons.school,
                        onPressed: () async {
                          await schoolReadingMaterialController.getSchoolDetailData(
                              bSchoolId: storage.read('branchId'));
                          await schoolReadingMaterialController
                              .getSchoolReadingMateData()
                              .then((_) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SchoolMaterialViewPage()));
                          });
                        }),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemDashboard(
    String title,
    IconData iconData,
    Color background,
  ) =>
      Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 2),
                color: Colors.blue,

                //color: Theme.of(context)
                //.primaryColor
                //.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
            // style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      );
}

Widget _buildCard(BuildContext context, String title, IconData icon,
    {VoidCallback? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Card(
      elevation: 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: Colors.blue.shade900,
          ),
          const SizedBox(height: 4),
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    ),
  );
}
