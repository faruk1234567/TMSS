import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../../CourseDetailServise/Course_Controller.dart';
import '../../CourseDetailServise/Course_page.dart';
import '../../CourseDurationDetailServise/Course_Duration_Detail_Controller.dart';
import '../../CourseDurationDetailServise/Course_Duration_Detail_Page.dart';
import '../../CourseWeekByDuration/controller/Course_week_controller.dart';
import '../../CourseWeekByDuration/view/Course_week_duration_views.dart';
import '../../ExamStatus/controller/Exam_status_controller.dart';
import '../../ExamStatus/views/Exam_status_module_search.dart';
import '../../InstructorList/controller/instructor_list_controller.dart';
import '../../LocalCourseSbjectList/Views/Local_Course_sub_list_search_bySchool.dart';
import '../../LocalCourseSbjectList/controller/local_course_subject_list_controller.dart';
import '../../traineeNomination/controller/trinee_nomination_controller.dart';
import '../../traineeNomination/views/trainee_nomination_course.dart';
import '../SPCController/School_passing_course_controller.dart';
import '../SPCModel/School_passing_course_model.dart';


class SchoolPassingCourseList extends StatefulWidget {
  SchoolPassingCourseList({super.key});

  @override
  State<SchoolPassingCourseList> createState() => _SchoolPassingCourseListState();
}

class _SchoolPassingCourseListState extends State<SchoolPassingCourseList> {
  final SchoolPassingCourseController controller=Get.put(SchoolPassingCourseController());
  double _scale = 1.0;

  double _baseScale = 1.0;

  void _onScaleStart(ScaleStartDetails details) {
    _baseScale = _scale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = _baseScale * details.scale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PassingCourseDetail",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red)),
      ),
      body: GestureDetector(
        onScaleStart: _onScaleStart,
        onScaleUpdate: _onScaleUpdate,
        child: SfDataGridTheme(
          data: SfDataGridThemeData(
              headerColor: Colors.deepPurple,
              gridLineColor: Colors.black,
              gridLineStrokeWidth: 5.0),
          // headerColor: const Color(0xff009889), child: null,),
          child: Transform.scale(
            scale: _scale,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                SizedBox(height: 12,),
                Expanded(
                  child: SfDataGrid(
                      source: LocalCourseGridSource(controller.SchoolPassingCourseList,controller),
                    columns: getColumns(),
                    gridLinesVisibility: GridLinesVisibility.both,
                    columnWidthMode: ColumnWidthMode.fill,
                    rowHeight: 80,),
                )
                //headerGridLinesVisibility: GridLinesVisibility.both),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<GridColumn> getColumns() {
  return <GridColumn>[
    // GridColumn(
    //   columnName: 'Name Of School',
    //   label: Container(
    //     padding: const EdgeInsets.all(8),
    //     alignment: Alignment.centerLeft,
    //     child: const Text('Name Of School'),
    //   ),
    // ),
    GridColumn(
      columnName: 'Ser:No',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: const Text(
            'Ser:No',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25),
            overflow: TextOverflow.clip,
            softWrap: true
        ),
      ),
    ),
    GridColumn(
      minimumWidth: 450,
      columnName: 'Name Of Course',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: const Text('Name Of Course',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25),
            overflow: TextOverflow.clip,
            softWrap: true),
      ),
    ),
    GridColumn(
      minimumWidth: 300,
      columnName: 'Date of Commencement',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Date of Commencement',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 250,
      columnName: 'Date of Completion',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Date of Completion',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 250,
      columnName: 'Duration',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Duration',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 250,
      columnName: 'Action',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: const Text('Action',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25)),
      ),
    ),
  ];
}


class LocalCourseGridSource extends DataGridSource {
  LocalCourseGridSource(this.PassingCourseDataList,this.controller);
  final SchoolPassingCourseController controller;

  late List<SPassingourseModel> PassingCourseDataList;
  late List<DataGridRow> dataGridRows;
  final SchoolPassingCourseController schoolPassingCourseController=Get.put(SchoolPassingCourseController());
  final CourseDetailController courseDetailController =
  Get.put(CourseDetailController());
  final CourseDurtionDetailController courseDurtionDetailController =
  Get.put(CourseDurtionDetailController());
  final TraineeNominationController traineeNominationController =
  Get.put(TraineeNominationController());
  final LocalCourseSubjectListController localCourseSubjectListController =
  Get.put(LocalCourseSubjectListController());
  final ExamStatusListController examStatusListController =
  Get.put(ExamStatusListController());
  final CourseWeekController courseWeekController =
  Get.put(CourseWeekController());
  final InstructorController instructorController= Get.put(InstructorController());

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      // Container(
      //   alignment: Alignment.centerLeft,
      //   padding: const EdgeInsets.all(4.0),
      //   child: Text(
      //     row.getCells()[0].value.toString(),
      //     overflow: TextOverflow.ellipsis,
      //     style: const TextStyle(color: Colors.deepOrangeAccent),
      //   ),
      // ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(4.0),
        child: Text(
          row.getCells()[0].value.toString(),
          style: TextStyle( fontSize: 23, fontWeight: FontWeight.bold,color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[1].value.toString(),
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          intl.DateFormat.yMMMd().format(row.getCells()[2].value),
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          intl.DateFormat.yMMMd().format(row.getCells()[3].value),
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: row.getCells()[4].value,
        //color: Colors.red,


      ),
      Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(14.0),
        child: row.getCells()[5].value,
        color: Colors.white10,
      ),
    ]);
  }

  @override
  List<DataGridRow> get rows {
    List<SPassingourseModel> listToUse = controller.searchList.isNotEmpty ? controller.searchList : PassingCourseDataList;
    final CourseWeekController courseWeekController =
    Get.put(CourseWeekController());
    return listToUse.asMap().entries.map<DataGridRow>((entry) {
          int index = entry.key;
          SPassingourseModel dataRows = entry.value;

          List<Widget> actionWidgets = [];
          if (dataRows.courseSyllabus == null) {
            actionWidgets = [
               OutlinedButton(

                  onPressed: () async {
                    // schoolLocalCourseController.getSchoolDetailData(bSchoolId: dataRows.baseSchoolNameId);

                    await courseDetailController
                        .getcourseDetail(
                      cDurationId: dataRows.courseDurationId,
                    )
                        .then((_) {
                      Navigator.of(Get.context!).push(MaterialPageRoute(
                        builder: (context) => CourseDetailsPage(),
                      ));
                    });
                  },


                  child: Text('CourseDetail',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold))),
              SizedBox(
                width: 4,
              ),
              OutlinedButton(
                  onPressed: () async {

                    await courseDurtionDetailController
                        .getcourseDurationDetail(
                      cDurationId: dataRows.courseDurationId,
                    )
                        .then((_) {
                      Navigator.of(Get.context!).push(MaterialPageRoute(
                        builder: (context) => CourseDurationDetailsPage(),
                      ));
                    });
                  },
                  child: Text('SubjectInstructorList',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold))),
              SizedBox(
                width: 4,
              ),
              OutlinedButton(
                  onPressed: () async {
                    await traineeNominationController
                        .getNomineeData(courseDurationId: dataRows.courseDurationId)
                        .then((_) {
                      Navigator.of(Get.context!).push(MaterialPageRoute(
                        builder: (context) => TraineeNominationScreenOne(
                            schoolName: dataRows.schoolName),
                      ));
                    });
                  },
                  child: Text('ListOfTrainee',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold))),
              SizedBox(
                width: 4,
              ),
              OutlinedButton(
                  onPressed: () async {
                    await instructorController.getInstructorFunction(courseNameId: dataRows.courseNameId,courseDurationId: dataRows.courseDurationId,baseSchoolNameId: dataRows.baseSchoolNameId);
                    await localCourseSubjectListController.getSchoolWithCourseData(courseNameId:dataRows.courseNameId,
                        baseSchoolNameId: dataRows.baseSchoolNameId,courseDurationId: dataRows.courseDurationId);

                    await localCourseSubjectListController.LocalCourseSubjectByList(
                        baseSchoolNameId: dataRows.baseSchoolNameId,
                        courseNameId: dataRows.courseNameId)
                        .then((_) {
                      Navigator.of(Get.context!).push(
                          MaterialPageRoute(builder: (context) => LCSlistScreen()));
                    });

                  }, child: Text('CurseSyllabus',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold))
                /* child: const CircleAvatar(
                  radius: 12, child: Text('CourseSyllabus'))),*/
              ),
              SizedBox(
                width: 4,
              ),
              OutlinedButton(
                  onPressed: () async {
                    await examStatusListController.ExamSubjectByList(
                        courseDurationId: dataRows.courseDurationId)
                        .then((_) {
                      Navigator.of(Get.context!).push(MaterialPageRoute(
                          builder: (context) => ExamStatusModuleScreen()));
                    });
                  },

                  child: Text('ExamStatus',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold))),
              SizedBox(
                width: 4,
              ),
              const CircleAvatar(radius: 12, child: Text('UC')),
              SizedBox(
                width: 4,
              ),
              const CircleAvatar(radius: 12, child: Text('UC')),
            ];
          }
          else if (dataRows.courseSyllabus != null) {
            actionWidgets = [
              OutlinedButton(
                  onPressed: () async {
                    await courseDetailController
                        .getcourseDetail(
                      cDurationId: dataRows.courseDurationId,
                    )
                        .then((_) {
                      Navigator.of(Get.context!).push(MaterialPageRoute(
                        builder: (context) => CourseDetailsPage(),
                      ));
                    });
                  },
                  child: Text('CourseDetail',
                    style: TextStyle(color: Colors.black),
                  )),
              SizedBox(
                width: 4,
              ),
              OutlinedButton(
                  onPressed: () async {
                    await courseDurtionDetailController
                        .getcourseDurationDetail(
                      cDurationId: dataRows.courseDurationId,
                    )
                        .then((_) {
                      Navigator.of(Get.context!).push(MaterialPageRoute(
                        builder: (context) => CourseDurationDetailsPage(),
                      ));
                    });
                  },
                  child: Text('SubjectInstructorList',style: TextStyle(color: Colors.black),)),

              SizedBox(
                width: 4,
              ),
              OutlinedButton(
                  onPressed: () async {
                    await traineeNominationController
                        .getNomineeData(courseDurationId: dataRows.courseDurationId)
                        .then((_) {
                      Navigator.of(Get.context!).push(MaterialPageRoute(
                        builder: (context) => TraineeNominationScreenOne(
                            schoolName: dataRows.schoolName),
                      ));
                    });
                  },
                  child: Text('List Of Trainee',
                      style: TextStyle(color: Colors.black)
                  )),
              SizedBox(
                width: 4,
              ),
              OutlinedButton(
                  onPressed: () async {
                    await instructorController.getInstructorFunction(courseNameId: dataRows.courseNameId,courseDurationId: dataRows.courseDurationId,baseSchoolNameId: dataRows.baseSchoolNameId);
                    await localCourseSubjectListController.getSchoolWithCourseData(courseNameId:dataRows.courseNameId,
                        baseSchoolNameId: dataRows.baseSchoolNameId,courseDurationId: dataRows.courseDurationId);

                    await localCourseSubjectListController.LocalCourseSubjectByList(
                        baseSchoolNameId: dataRows.baseSchoolNameId,
                        courseNameId: dataRows.courseNameId)
                        .then((_) {
                      Navigator.of(Get.context!).push(
                          MaterialPageRoute(builder: (context) => LCSlistScreen()));
                    });

                  }, child:Text(
                'CourseSyllabus',
                style: TextStyle(color: Colors.black),
              )
                /* child: const CircleAvatar(
                  radius: 12, child: Text('CourseSyllabus'))),*/
              ),
              SizedBox(
                width: 4,
              ),
              OutlinedButton(
                  onPressed: () async {
                    await examStatusListController.ExamSubjectByList(
                        courseDurationId: dataRows.courseDurationId)
                        .then((_) {
                      Navigator.of(Get.context!).push(MaterialPageRoute(
                          builder: (context) => ExamStatusModuleScreen()));
                    });
                  },

                  child: Text(
                    'ExamStatus',
                    style: TextStyle(color: Colors.black),
                  )),
              SizedBox(
                width: 4,
              ),
              const CircleAvatar(radius: 12, child: Text('UC')),
              SizedBox(
                width: 4,
              ),
              const CircleAvatar(radius: 12, child: Text('UC')),
              SizedBox(
                width: 4,
              ),
              const CircleAvatar(radius: 12, child: Text('UC')),
            ];
          }
          Widget weekText() {
            return InkWell(
                onTap: ()async {
                  await courseWeekController
                      .getcourseDurationDetail(cDurationId: dataRows.courseDurationId)
                      .then((_) {
                    Get.to(() => CourseWeek());
                  });
                },
                child: Text(
                  '${dataRows.completeWeek}/ ${dataRows.countWeek} (week)',style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
                  overflow: TextOverflow.ellipsis,));
          }

          return DataGridRow(cells: [
            DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
            DataGridCell<String>(
                columnName: 'Name of Course',
                value: '${dataRows.course} ${dataRows.courseTitle}'),
            DataGridCell<DateTime>(
                columnName: 'Date of Commencement', value: dataRows.durationFrom),
            DataGridCell<DateTime>(
                columnName: 'Date of Completion', value: dataRows.durationTo),
            DataGridCell<Widget>(columnName: 'Duration', value: weekText()),

            DataGridCell<Widget>(columnName: 'Action', value: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: actionWidgets))),
          ]);
        }).toList(growable: false);
  }
}


