import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../controller/Exam_evuluation_controller.dart';
import '../model/Examevaluation_list_model.dart';










class ExamEvuluationViews extends StatefulWidget {
  ExamEvuluationViews({super.key});

  @override
  State<ExamEvuluationViews> createState() => _ExamEvuluationViewsState();
}

class _ExamEvuluationViewsState extends State<ExamEvuluationViews> {
  final ExamEvuluationController controller=Get.put(ExamEvuluationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam Evaluation List",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red)),
      ),
      body: SfDataGridTheme(
        data:  SfDataGridThemeData(
            headerColor: Colors.blueGrey,
            gridLineColor: Colors.black, gridLineStrokeWidth: 3.0),
        // headerColor: const Color(0xff009889), child: null,),
        child:
              Column(
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
              SizedBox(height: 20,),
              Expanded(
                child: SfDataGrid(
                    source: LocalCourseGridSource(controller.ExamEvuluationList,controller),
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
    /*GridColumn(
      minimumWidth: 350,
      columnName: 'SerNo',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text("${index+1}")),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
              fontSize: 10,
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true),
      ),*/
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
                fontSize: 23),
            overflow: TextOverflow.clip,
            softWrap: true
        ),
      ),
    ),
    GridColumn(
      minimumWidth: 450,
      columnName: 'Course',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
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
      minimumWidth: 450,
      columnName: 'subject',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('subject', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 400,
      columnName: 'ExamDate',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('ExamDate', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 200,
      columnName: 'Exam Status',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Exam Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 200,
      columnName: 'Instr Submission',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Instr Submission', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 200,
      columnName: 'Admin Aproval',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Admin Aproval', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 150,
      columnName: 'Instructor',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Instructor', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
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
  LocalCourseGridSource(this.LocalCourseDataList, this.controller) ;
  final ExamEvuluationController controller;

  late List<ExamEvuluationModel> LocalCourseDataList;
  late List<DataGridRow> dataGridRows;
  //final TraineeNominationController traineeNominationController = Get.put(TraineeNominationController());

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {


    return DataGridRowAdapter(
        color: Colors.indigo[300],
        cells: [

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
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[0].value.toString(),
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[1].value.toString(),
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[2].value.toString(),
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              intl.DateFormat.yMMMd().format( row.getCells()[3].value),
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[4].value.toString(),
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[5].value.toString(),
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[6].value.toString(),
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[7].value.toString(),
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),



          /*Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(14.0),
        child: row.getCells()[4].value,
        color: Colors.green,
      ),*/
        ]
    );
  }

  @override
  List<DataGridRow> get rows {
    List<ExamEvuluationModel> listToUse = controller.searchList.isNotEmpty ? controller.searchList : LocalCourseDataList;
    return listToUse.asMap().entries.map<DataGridRow>((entry) {
      // List<Widget> actionWidgets = [];
      ExamEvuluationModel dataRows = entry.value;
      int index = entry.key;
      String getStatus() {


        if (dataRows.attendanceComplete == 1) {
          return "Completed";
        } else if (dataRows.attendanceComplete == 0 ) {
          return "Not Held";
        }
        // Add a default return value in case none of the conditions are met
        return "Status unknown";
      }
      String getSub() {


        if (dataRows.attendanceComplete == 1) {
          return "Pending";
        } else if (dataRows.attendanceComplete == 0 ) {
          return " ";
        }
        // Add a default return value in case none of the conditions are met
        return "Status unknown";
      }
      String resultSub() {


        if (dataRows.resultSubmissionStatus == 0) {
          return "";
        }
        // Add a default return value in case none of the conditions are met
        return "Status unknown";
      }




      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'Course', value: '${dataRows.course}-${dataRows.courseTitle}'),
        DataGridCell<String>(columnName: 'Subject', value: '${dataRows.subjectName}-(${dataRows.shortName})'),
        DataGridCell<DateTime>(columnName: 'Subject', value: dataRows.date),
        DataGridCell<String>(columnName: 'Subject', value: getStatus()),
        DataGridCell<String>(columnName: 'Subject', value: getSub()),
        DataGridCell<String>(columnName: 'Subject', value: resultSub()),
        DataGridCell<String>(columnName: 'Subject', value: '(PNO${dataRows.pno})'),




      ]);
    }).toList(growable: false);
  }
}

