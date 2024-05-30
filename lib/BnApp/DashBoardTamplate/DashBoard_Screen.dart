import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:navy_project/BnApp/DashBoardTamplate/bn_data_schools_screen.dart';

import '../../Splash/splash_screen.dart';
import '../../api/Bn_AppRoutes.dart';
import '../../api/storage.dart';
import '../Budget/Views/Budget_views.dart';
import '../CivilOfficersBiodata/contrller/Civil_bio_data_controller.dart';
import '../CivilOfficersBiodata/view/ivil_off-Bio_view.dart';
import '../ForeignOfficerBioData/controller/foreign_officers_controller.dart';
import '../ForeignOfficerBioData/view/foreign_officer_view.dart';
import '../ForeignTraineeList/controller/foreign_trainee_controller.dart';
import '../ForeignTraineeList/view/Foreign_trainee_list.dart';
import '../GetCourseCountryBySchool/views/bn_data_school_By_course__screen.dart';
import '../GetCourseNamedBySchool/views/bn_data_school_named_school_screen.dart';
import '../InterServiseCourse/View/InterServisePage.dart';
import '../JcosExamList/views/Jco_page.dart';
import '../LoginService/login_Screen.dart';
import '../Mist/controller/mist_controller.dart';
import '../Mist/view/mist_view.dart';
import '../QExam/View/qExam_page.dart';
import '../ReadingMUplod/controller/Read_upload_controller.dart';
import '../ReadingMUplod/view/Read_material_uplod_view.dart';
import '../RunningForeignCourse/Views/foreign_course_page.dart';
import '../RunningOfficerInformation/controller/officer_controller.dart';
import '../RunningOfficerInformation/view/Officer_Course_list.dart';
import '../SailorsInformation/controller/sailors_controller.dart';
import '../SailorsInformation/view/sailors_course_list.dart';
import '../StafCollegeExam/Views/Staff_college_view_page.dart';
import '../TotalTraineeList/controller/Total_trainee_controller.dart';
import '../TotalTraineeList/views/Course_list.dart';
import '../othersOfficerBiodata/controller/other_officer_controller.dart';
import '../othersOfficerBiodata/view/others_officer_view.dart';
import '../salorsBiadata/cotroller/sailors_bio_controller.dart';
import '../salorsBiadata/view/sailors_view.dart';
import 'Bn_DataSearch.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TotalTraineeController totalTraineeController = Get.put(TotalTraineeController());
    final TotalOfficerController totalOfficerController = Get.put(TotalOfficerController());
    final TotalSailorController totalSailorController = Get.put(TotalSailorController());
    final ForeignTrainingController foreignTrainingController = Get.put(ForeignTrainingController());
    final ForeignOfficerController foreignOfficerController = Get.put(ForeignOfficerController());
    final MistController mistController = Get.put(MistController());
    final CivilOffBioController civilOffBioController = Get.put(CivilOffBioController());
    final SailorsOfficerController sailorsOfficerController = Get.put(SailorsOfficerController());
    final OtherOfficerController otherOfficerController = Get.put(OtherOfficerController());
    final RmateUploadController rmateUploadController = Get.put(RmateUploadController());

    void logout(BuildContext context) {
      storage.write('token', null); // Invalidate token
      Get.offAllNamed(AppRoutes.login); // Pop until reaching the root navigator
    }

    void GoBack() {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => CourseListScreen()));
    }

    void GoOfficerInDetail() {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => OfficerCourseListScreen()));
    }

    void GoSailorInDetail() {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SailorsCourseListScreen()));
    }

    void GoForeignInDetail() {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ForeignCourseListScreen()));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /// resizeToAvoidBottomInset: false,

        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('Welcome TMS Dashbord', style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  logout(context);
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
                            style: (TextStyle(color: Colors.black, fontSize: 24)),
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
                                '${totalTraineeController.totalTraineeList.length}',
                                style: TextStyle(color: Colors.lightGreen, fontSize: 35, fontStyle: FontStyle.italic),
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
                            style: (TextStyle(color: Colors.black, fontSize: 24)),
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
                                '${totalOfficerController.totalofficerList.value.length}',
                                style: TextStyle(color: Colors.lightGreen, fontSize: 35, fontStyle: FontStyle.italic),
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
                            style: (TextStyle(color: Colors.black, fontSize: 24)),
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
                                '${totalSailorController.totalsailorsList.value.length}',
                                style: TextStyle(color: Colors.lightGreen, fontSize: 35, fontStyle: FontStyle.italic),
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
                            style: (TextStyle(color: Colors.black, fontSize: 24)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "0",
                            style: TextStyle(color: Colors.lightGreen, fontSize: 35, fontStyle: FontStyle.italic),
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
                            style: (TextStyle(color: Colors.black, fontSize: 24)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              GoForeignInDetail();
                            },
                            child: Obx(
                              () => Text(
                                '${foreignTrainingController.totalForeignTraineeList.value.length}',
                                style: TextStyle(color: Colors.lightGreen, fontSize: 35, fontStyle: FontStyle.italic),
                              ),
                            ),
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
                    _buildCard(context, 'Local\nCourses', Icons.people, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BnDataSchoolsScreen()));
                    }),
                    _buildCard(context, 'Foreign\nCourses', Icons.school, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForeignRunnungCourses()));
                    }),
                    _buildCard(context, 'Inter-Servise\nCourse', Icons.class_, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InterServiseCourses()));
                    }),
                    _buildCard(context, 'Q-Exam', Icons.check_circle, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QexamPage()));
                    }),
                    _buildCard(context, 'JCOS \nExam', Icons.assignment, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => JcoPage()));
                    }),
                    _buildCard(context, 'S-Collage\Exam', Icons.people, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StafCollegePage()));
                    }),
                    _buildCard(context, 'Budget', Icons.class_, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BudgetPage()));
                    }),
                    _buildCard(context, 'School\nDetail', Icons.check_circle, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GetCountryBySchool()));
                    }),
                    _buildCard(context, 'Reading\nMaterials', Icons.assignment, onPressed: () {}),
                    _buildCard(context, 'Course\nNames', Icons.school, onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => getNamedBySchool()));
                    }),
                    _buildCard(context, 'Mist', Icons.assignment, onPressed: () async {
                      mistController.pageNumber.value = 1;
                      await mistController.getMistDetailData().then((_) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MistListPage()));
                      });
                    }),
                    _buildCard(context, 'Sailor\n BIO Data', Icons.assignment, onPressed: () async {
                      sailorsOfficerController.pageNumber.value = 1;
                      await sailorsOfficerController.getSailorsOfficerDetail().then((_) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SailorsOfficerBoiPage()));
                      });
                    }),
                    _buildCard(context, 'Foreign Officer\n BIOData', Icons.assignment, onPressed: () async {
                      foreignOfficerController.pageNumber.value = 1;
                      await foreignOfficerController.getForeignOfficerDetail().then((_) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForeignOfficerBoiPage()));
                      });
                    }),
                    _buildCard(context, 'Civil Instructor\n BIO Data', Icons.assignment, onPressed: () async {
                      civilOffBioController.pageNumber.value = 1;
                      await civilOffBioController.getCBdataDetail().then((_) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CivilOfficerBioDataView()));
                      });
                    }),
                    _buildCard(context, 'Officer\nBIOData', Icons.assignment, onPressed: () async {
                      otherOfficerController.pageNumber.value = 1;
                      await otherOfficerController.getOthersOfficerDetail().then((_) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OthersOfficerBoiPage()));
                      });
                    }),
                    _buildCard(context, 'RMaterial\nUpload', Icons.assignment, onPressed: () async {
                      rmateUploadController.pageNumber.value = 1;
                      rmateUploadController.getReadMaterialUplodDetail().then((_) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ReadMaUpload()));
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

Widget _buildCard(BuildContext context, String title, IconData icon, {VoidCallback? onPressed}) {
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
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    ),
  );
}
