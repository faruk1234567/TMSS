import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../../CourseDetailServise/Course_Controller.dart';
import '../../CourseDetailServise/Course_page.dart';
import '../../CourseDurationDetailServise/Course_Duration_Detail_Controller.dart';

import '../../CourseWeekByDuration/controller/Course_week_controller.dart';

import '../../traineeNomination/controller/trinee_nomination_controller.dart';
import '../../traineeNomination/views/trainee_nomination_course.dart';
import '../SUCController/School_upcomming_controller.dart';
import '../SUCModel/School_upcomming_model.dart';

class SchoolUpcommigCourseView extends StatelessWidget {
  SchoolUpcommigCourseView({super.key});
  final SchoolUpcommingCourseController controller =
      Get.put(SchoolUpcommingCourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UpcommingCourseDetail",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red)),
      ),
      body: SfDataGridTheme(
        data: SfDataGridThemeData(
            headerColor: Colors.blueGrey,
            gridLineColor: Colors.black,
            gridLineStrokeWidth: 3.0),
        // headerColor: const Color(0xff009889), child: null,),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SfDataGrid(
                  source: LocalCourseGridSource(
                      controller.SchoolUpcommingCourseList),
                  columns: getColumns(),
                  gridLinesVisibility: GridLinesVisibility.both),
            )
            //headerGridLinesVisibility: GridLinesVisibility.both),
          ],
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
        child: const Text('Ser:No',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 23),
            overflow: TextOverflow.clip,
            softWrap: true),
      ),
    ),
    GridColumn(
      minimumWidth: 400,
      columnName: 'Come From',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: const Text('Come From',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
            overflow: TextOverflow.clip,
            softWrap: true),
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
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
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
      minimumWidth: 150,
      columnName: 'NBCD Week',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('NBCD Week',
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
                fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25)),
      ),
    ),
  ];
}

class LocalCourseGridSource extends DataGridSource {
  LocalCourseGridSource(this.UpcommingCourseDataList) {
    buildDataGridRow();
  }

  late List<SupcommingModel> UpcommingCourseDataList;
  late List<DataGridRow> dataGridRows;
  final SchoolUpcommingCourseController schoolLocalCourseController =
      Get.put(SchoolUpcommingCourseController());
  final CourseDetailController courseDetailController =
      Get.put(CourseDetailController());
  final CourseDurtionDetailController courseDurtionDetailController =
      Get.put(CourseDurtionDetailController());
  final TraineeNominationController traineeNominationController =
      Get.put(TraineeNominationController());


  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(4.0),
        child: Text(
          row.getCells()[0].value.toString(),
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[1].value.toString(),
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.indigo),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[2].value.toString(),
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.indigo),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          intl.DateFormat.yMMMd().format(row.getCells()[3].value),
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.indigo),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          intl.DateFormat.yMMMd().format(row.getCells()[4].value),
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.indigo),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[5].value.toString(),
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.indigo),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(14.0),
        child: row.getCells()[6].value,
        color: Colors.white10,
      ),
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    final CourseWeekController courseWeekController =
        Get.put(CourseWeekController());
    dataGridRows =
        UpcommingCourseDataList.asMap().entries.map<DataGridRow>((entry) {
      int index = entry.key;
      SupcommingModel dataRows = entry.value;

      List<Widget> actionWidgets = [
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
            child: Text('CourseDetail', style: TextStyle(color: Colors.black))),
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
            child:
                Text('List Of Trainee', style: TextStyle(color: Colors.black))),
      ];

      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(
            columnName: 'Come From',
            value: '${dataRows.schoolName}'),
        DataGridCell<String>(
            columnName: 'Name of Course',
            value: '${dataRows.course} ${dataRows.courseTitle}'),

        DataGridCell<DateTime>(
            columnName: 'Date of Commencement', value: dataRows.durationFrom),
        DataGridCell<DateTime>(
            columnName: 'Date of Completion', value: dataRows.durationTo),
        DataGridCell<String>(
            columnName: 'NBCD Week',
            value: '${dataRows.nbcd}Week(s)'),
        DataGridCell<Widget>(
            columnName: 'Action',
            value: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: actionWidgets))),
      ]);
    }).toList(growable: false);
  }
}
