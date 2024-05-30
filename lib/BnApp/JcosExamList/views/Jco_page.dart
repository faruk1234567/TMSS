import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../BnaResultList/view/Bna_resultSheet_mark.dart';
import '../BnaSubjectList/controller/Bna_sub_list_controller.dart';
import '../BnaSubjectList/view/Bna_subjectList_view.dart';
import '../ExamStatus/controller/Jsos_exam_status_controller.dart';
import '../ExamStatus/view/Exam_status_result_view.dart';
import '../controller/Jco_cotroller.dart';
import '../model/Jco_model.dart';









class JcoPage extends StatelessWidget {
  JcoPage({super.key});

  final JcoController controller = Get.put(JcoController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JCO's Exam List",style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.indigo)),
      ),
      body: SfDataGridTheme(
        data:  SfDataGridThemeData(
            headerColor: Colors.blueGrey,
            gridLineColor: Colors.black, gridLineStrokeWidth: 3.0),
        // headerColor: const Color(0xff009889), child: null,),
        child: Obx(
              () => Column(
            mainAxisSize: MainAxisSize.max,


            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SfDataGrid(
                    source: LocalCourseGridSource(controller.JcoCourseList),
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
                fontSize: 25),
            overflow: TextOverflow.clip,
            softWrap: true
        ),
      ),
    ),

    GridColumn(
      minimumWidth: 450,
      columnName: 'ExamName',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('ExamName',
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
      minimumWidth: 200,
      columnName: 'DurationFrom',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('DurationFrom', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 200,
      columnName: 'DurationTo',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('DurationTo', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 200,
      columnName: 'Candidates',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Candidates', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),

    GridColumn(
      minimumWidth: 500,
      columnName: 'Action',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('SubjectList', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
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
  LocalCourseGridSource(this.JcoDataList) {
    buildDataGridRow();
  }

  late List<JcoExam> JcoDataList;
  late List<DataGridRow> dataGridRows;

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
            padding: const EdgeInsets.all(4.0),
            child: Text(
              row.getCells()[0].value.toString(),
              style: TextStyle( fontSize: 23, fontWeight: FontWeight.bold,color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[1].value.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              intl.DateFormat.yMMMd().format( row.getCells()[2].value),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              intl.DateFormat.yMMMd().format( row.getCells()[3].value),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3.0),
              child: Text(
                row.getCells()[4].value.toString(),
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              )
          ),
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
        ]
    );
  }

  @override
  List<DataGridRow> get rows => dataGridRows;
  final BnaSubListController bnaSubListController=Get.put(BnaSubListController());
  final JoExamStatusController joExamStatusController=Get.put(JoExamStatusController());

  void buildDataGridRow() {
   // LocalCourseDataList.asMap().entries.map<DataGridRow>((entry)
    dataGridRows = JcoDataList.asMap().entries.map<DataGridRow>((entry) {
      JcoExam dataRows = entry.value;
      int index= entry.key;
      List<Widget> actionWidgets = [
        InkWell(
            onTap: () async {
              await bnaSubListController.getBnaSubjectList(cDurationId: dataRows.courseDurationId).then((_){
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => BnaSubjectPage(),
                )
                );





              }
              );










            },
            child: Text('SubjectList',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
        SizedBox(
          width: 20,
        ),
        InkWell(
            onTap: () async {






            },
            child: Text('SubjectExaminer List',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
        SizedBox(
          width: 20,
        ),
        InkWell(
            onTap: () async {
              await bnaSubListController.getBnaSubjectList(cDurationId: dataRows.courseDurationId).then((_){
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => BnaResultPage(),
                )
                );





              }
              );









            },
            child: Text('Subject Result List',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
        SizedBox(
          width: 20,
        ),
        InkWell(
            onTap: () async {

              await joExamStatusController. getExamStatus(cDurationId: dataRows.courseDurationId).then((_){
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => JoExamStatusPage(),
                )
                );





              }
              );





            },
            child: Text('Exam Status',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),

      ];
      return DataGridRow(cells: [

        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'Exam Name', value: '${dataRows.course} ${dataRows.courseTitle}'),
        DataGridCell<DateTime>(columnName: 'Duration From', value:dataRows.durationFrom ),
        DataGridCell<DateTime>(columnName: 'Duration To', value:dataRows.durationTo),
        DataGridCell<int>(columnName: 'Candidates', value: dataRows.candidates ),
        DataGridCell<Widget>(columnName: 'Action', value: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: actionWidgets))),

      ]);
    }).toList(growable: false);
  }
}

