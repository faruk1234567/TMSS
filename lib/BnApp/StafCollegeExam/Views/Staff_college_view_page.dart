import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../../CourseDurationDetailServise/Course_Duration_Detail_Controller.dart';
import '../../QExam/BnaSubjectNameListByCourse/controller/bna_subjectList_controller.dart';
import '../../QExam/BnaSubjectNameListByCourse/view/bna_subject_name_view.dart';
import '../../QExam/QexamCourseDurationDetail/controller/Qexam_course_duration_controller.dart';
import '../Controller/Staf_college_exam_controller.dart';
import '../StaffCollegeMarkList/StafCollegeList/controller/sCollege_list_controller.dart';
import '../StaffCollegeMarkList/controller/staff_college_marklist_controller.dart';
import '../StaffCollegeMarkList/view/StaffMark_list_view.dart';
import '../model/Staf_college_exam_model.dart';

class StafCollegePage extends StatelessWidget {
  StafCollegePage({super.key});

  final StafCollegeExamController controller =
      Get.put(StafCollegeExamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StaffCollege Exam ",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo)),
      ),
      body: SfDataGridTheme(
        data: SfDataGridThemeData(
            headerColor: Colors.blueGrey,
            gridLineColor: Colors.black,
            gridLineStrokeWidth: 3.0),
        // headerColor: const Color(0xff009889), child: null,),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SfDataGrid(
                    source:
                        LocalCourseGridSource(controller.StaffCollegeExamList),
                    columns: getColumns(),
                    gridLinesVisibility: GridLinesVisibility.both),
              )
              //headerGridLinesVisibility: GridLinesVisibility.both),
            ],
          ),
        ),
      ),
    );
  }
}

List<GridColumn> getColumns() {
  return <GridColumn>[
    GridColumn(
      columnName: 'Ser:No',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: const Text('Ser:No',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
            overflow: TextOverflow.clip,
            softWrap: true),
      ),
    ),
    GridColumn(
      minimumWidth: 860,
      columnName: 'Course',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('Course',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true),
      ),
    ),
    GridColumn(
      minimumWidth: 150,
      columnName: 'DurationFrom',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('DurationFrom',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 150,
      columnName: 'DurationTo',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('DurationTo',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 150,
      columnName: 'Candidates',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Candidates',
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
        alignment: Alignment.center,
        child: const Text('Action',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                fontSize: 25)),
      ),
    ),

    /*GridColumn(
      minimumWidth: 250,
      columnName: 'Action',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: const Text('Action', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink, fontSize: 17)),
      ),
    ),*/
  ];
}

class LocalCourseGridSource extends DataGridSource {
  LocalCourseGridSource(this.StafCollegeDataList) {
    buildDataGridRow();
  }

  late List<StafCollegeExam> StafCollegeDataList;
  late List<DataGridRow> dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(color: Colors.indigo[300], cells: [
      //color: Colors.indigo[300],
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
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(3.0),
        child: Text(
          row.getCells()[1].value.toString(),
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(3.0),
        child: Text(
          intl.DateFormat.yMMMd().format(row.getCells()[2].value),
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(3.0),
        child: Text(
          intl.DateFormat.yMMMd().format(row.getCells()[3].value),
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3.0),
          child: Text(
            row.getCells()[4].value.toString(),
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          )),
      Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(15.0),
        child: row.getCells()[5].value,
        color: Colors.indigo,
      ),

      /*Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(14.0),
        child: row.getCells()[4].value,
        color: Colors.green,
      ),*/
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;
  final BnaSubjectListController bnaSubjectListController =
      Get.put(BnaSubjectListController());
  final StaffCollegeMarkListController staffCollegeMarkListController =
      Get.put(StaffCollegeMarkListController());
  final ScollegeListController controller12=Get.put(ScollegeListController());

  void buildDataGridRow() {
    dataGridRows =
        StafCollegeDataList.asMap().entries.map<DataGridRow>((entry) {
      StafCollegeExam dataRows = entry.value;
      int index = entry.key;
      List<Widget> actionWidgets = [
        InkWell(
            onTap: () async {
              await bnaSubjectListController.getBnaSubjectListData().then((_) {
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => BnaSubjectView(),
                ));
              });
            },
            child: Text('SubjectList',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
        SizedBox(
          width: 30,
        ),
        InkWell(
            onTap: () async {
              await controller12.getStaffCollegeList(cDurationId: dataRows.courseDurationId);
              await staffCollegeMarkListController
                  .getsCMarkListData(
                      courseDurationId: dataRows.courseDurationId)
                  .then((_) {
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => StafCollegeMarkListView(),
                ));
              });
            },
            child: Text('View Mark List',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
      ];
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(
            columnName: 'Course',
            value: '${dataRows.course} ${dataRows.courseTitle}'),
        DataGridCell<DateTime>(
            columnName: 'Duration', value: dataRows.durationFrom),
        DataGridCell<DateTime>(
            columnName: 'Duration', value: dataRows.durationTo),
        DataGridCell<int>(columnName: 'Candidates', value: dataRows.candidates),
        DataGridCell<Widget>(
            columnName: 'Action',
            value: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: actionWidgets))),
      ]);
    }).toList(growable: false);
  }
}
