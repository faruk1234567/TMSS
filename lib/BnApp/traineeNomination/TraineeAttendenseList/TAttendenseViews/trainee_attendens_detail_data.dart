import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:intl/intl.dart' as intl;

import '../TAttendenseController/trainee_attendense_controller.dart';
import '../TAttendenseModel/t_attendense_model.dart';






class TraineeAttendenseDataSearch extends StatefulWidget {
  TraineeAttendenseDataSearch({Key? key, required this.date});
  DateTime? date;

  @override
  State<TraineeAttendenseDataSearch> createState() => _DataSearchState();
}

class _DataSearchState extends State<TraineeAttendenseDataSearch> {
  final TraineeAttendenseController controller = Get.put(TraineeAttendenseController());

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
          title: Text('Trainee Attendense List',
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
                data: controller.traineeAttendenseList.where(
                        (p0) => p0.attendanceDate == widget.date).toList(),

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
  final List<TraineeAttendenseModel> data;

  DataTableWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: LocalCourseGridSource(data),
      columns: getColumns(),
      rowHeight: 60,
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
        minimumWidth: 150,
        columnName: 'Period',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Period',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
      GridColumn(
        minimumWidth: 350
        ,
        columnName: 'Subject',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Subject',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
      GridColumn(
        minimumWidth: 250,
        columnName: 'Type',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Type',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
      GridColumn(
        minimumWidth: 300,
        columnName: 'Attandance Status',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Attandance Status',
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
        columnName: 'Absent Remarks',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Absent Remarks',
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
  LocalCourseGridSource(this.TraineeAttenDataList) {
    buildDataGridRow();
  }

  late List<TraineeAttendenseModel> TraineeAttenDataList;
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
          style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[1].value.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[2].value.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[3].value.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[4].value.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[5].value.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
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
        TraineeAttenDataList.asMap().entries.map<DataGridRow>((entry) {
          int index = entry.key;
          TraineeAttendenseModel dataRows = entry.value;



          // List<Widget> actionWidgets = [];

          return DataGridRow(cells: [
            DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
            DataGridCell<dynamic>(columnName: 'ExamStatus', value: dataRows.periodName=="null"?" ":dataRows.periodName),
            DataGridCell<dynamic>(columnName: 'SubjectName', value: '${dataRows.subjectName} ${dataRows.shortName.toString()=="null"?'()':'(${dataRows.shortName})'}' ),
            DataGridCell<dynamic>(columnName: 'ExamStatus', value: dataRows.classTypeName.toString()=="null"?" ":dataRows.classTypeName),
            DataGridCell<dynamic>(columnName: 'Examiner Result Submit Status', value: dataRows.attendanceStatus.toString()=="true"?"Present ":'Absent'),
            DataGridCell<dynamic>(columnName: 'Admin Approve', value: dataRows.attendanceRemarksCause.toString()=="null"?" ":dataRows.attendanceRemarksCause),

          ]);
        }).toList(growable: false);
  }
}
