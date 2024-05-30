import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:intl/intl.dart' as intl;

import '../controller/Exam_status_controller.dart';
import '../model/Exam_status_model.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_core/theme.dart';



class ExamStatusDataSearch extends StatefulWidget {
  ExamStatusDataSearch({Key? key, required this.moduleName});
  String? moduleName;

  @override
  State<ExamStatusDataSearch> createState() => _DataSearchState();
}

class _DataSearchState extends State<ExamStatusDataSearch> {
  final ExamStatusListController controller = Get.put(ExamStatusListController());

  /*Set<String> uniqueSchoolNames = <String>{};

  @override
  initState() {
    super.initState();
    uniqueSchoolNames =
        controller.localCourseList.map((course) => course.schoolName!).toSet();
  }*/

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => controller.isLoading.value
          ? CircularProgressIndicator()
          : Scaffold(
        // Assuming two schools, adjust as needed

        appBar: AppBar(
          title: Text('Exam Subject List',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo)),



        ),


        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*  InkWell(
                    onTap: () async {
                      await courseSubjectListController.getSubjectListData(baseschoolnameid:dataRows.baseschoolnameid,
                          courseNameId:dataRows.courseNameId).then


                        ((_){
                        Navigator.of(Get.context!).push(MaterialPageRoute(
                          builder: (context) => CourseSubjectList(),
                        )
                        );

                      }
                      );


                    },


                    child:  Text('Instructor List', style: TextStyle(
                        fontWeight:  FontWeight.bold,fontSize: 20,color: Colors.red))

                )*/
              ],

            ),

            SizedBox(
              height:14,
            ),
            Row(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Colors.redAccent,
              )
            ]),
            Expanded(
              child: DataTableWidget(
                data: controller.ESList.where(
                        (p0) => p0.moduleName == widget.moduleName).toList(),

                // controller2.localCourseList.map((element) => DataTableWidget(data: controller2.localCourseList.where((p0) => p0.baseSchoolNameId == element.baseSchoolNameId).toList())).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List<ExamStatusModel> data;

  DataTableWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfDataGridTheme(
        data: SfDataGridThemeData(
            headerColor: Colors.deepPurple,
            gridLineColor: Colors.black,
            gridLineStrokeWidth: 5.0),
        child: SfDataGrid(
          source: LocalCourseGridSource(data),
          columns: getColumns(),
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          columnWidthMode: ColumnWidthMode.fill,
          rowHeight: 50,
        ),
      ),
    );
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
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true
          ),
        ),
      ),
      GridColumn(
        minimumWidth: 350,
        columnName: 'SubjectName',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('SubjectName',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
      GridColumn(
        minimumWidth: 200,
        columnName: 'Exam Status',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Exam Status',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
      GridColumn(
        minimumWidth: 380,
        columnName: 'Examiner Result Submit Status',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Examiner Result Submit Status',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
      GridColumn(
        minimumWidth: 200,
        columnName: 'Admin Approve',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Admin Approve',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
      GridColumn(
        minimumWidth: 200,
        columnName: 'Examiner',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Examiner',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),

    ];
  }
}

class LocalCourseGridSource extends DataGridSource {
  LocalCourseGridSource(this.LocalCourseDataList) {
    buildDataGridRow();
  }

  late List<ExamStatusModel> LocalCourseDataList;
  late List<DataGridRow> dataGridRows;
  //final CourseSubjectListController getCoursenamedBySchool = Get.put(CourseSubjectListController());

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
          style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[1].value.toString(),
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[2].value.toString(),
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[3].value.toString(),
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[4].value.toString(),
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[5].value.toString(),
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),

    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;
  // CourseSubjectListController courseSubjectListController= Get.put(CourseSubjectListController());

  void buildDataGridRow() {
    dataGridRows =
        LocalCourseDataList.asMap().entries.map<DataGridRow>((entry) {
          int index = entry.key;
          ExamStatusModel dataRows = entry.value;



          // List<Widget> actionWidgets = [];

          return DataGridRow(cells: [
            DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
            DataGridCell<String>(columnName: 'SubjectName', value: '${dataRows.subjectName} ${dataRows.shortName.toString()=="null"?'()':'(${dataRows.shortName})'}' ),
            DataGridCell<dynamic>(columnName: 'ExamStatus', value: dataRows.attendanceComplete.toString()=="null"?" Unscheduled":'Exam Complete'),
            DataGridCell<dynamic>(columnName: 'Examiner Result Submit Status', value: dataRows.resultSubmissionStatus.toString()=="null"?" ":'Pending'),
            DataGridCell<dynamic>(columnName: 'Admin Approve', value: dataRows.finalApproveStatus.toString()=="null"?" ":'Pending'),
            DataGridCell<String>(columnName: 'Examiner', value: '${dataRows.position.toString()=="null"?"":'${dataRows.position}'} ${dataRows.name.toString()=="null"?"":'${dataRows.name}'}${dataRows.pno.toString()=="null"?"":'\n PNO-${dataRows.pno}'} '),

          ]);
        }).toList(growable: false);
  }
}
