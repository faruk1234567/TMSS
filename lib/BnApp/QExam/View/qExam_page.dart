import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../BnaSubjectNameListByCourse/controller/bna_subjectList_controller.dart';
import '../BnaSubjectNameListByCourse/view/bna_subject_name_view.dart';
import '../Controller/qExam_controller.dart';
import '../QexamCourseDurationDetail/controller/Qexam_course_duration_controller.dart';
import '../TraineeMarkListByQexam/controller/traineeMarkList_qexam_controller.dart';
import '../TraineeMarkListByQexam/view/trainee_qexam_mark_list_view.dart';
import '../model/qExam_model.dart';







class QexamPage extends StatelessWidget {
  QexamPage({super.key});

  final QexamController controller = Get.put(QexamController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qexam List",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo)),
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
                    source: LocalCourseGridSource(controller.QexamCourseList),
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
                fontSize: 23),
            overflow: TextOverflow.clip,
            softWrap: true
        ),
      ),
    ),

    GridColumn(
      minimumWidth: 400,
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
      minimumWidth: 220,
      columnName: 'DurationFrom',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('DurationFrom', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 220,
      columnName: 'DurationTo',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('DurationTo', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 150,
      columnName: 'Candidates',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Candidates', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),

    GridColumn(
      minimumWidth: 300,
      columnName: 'Action',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Action', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
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
  LocalCourseGridSource(this.QexamDataList) {
    buildDataGridRow();
  }

  late List<QExam> QexamDataList;
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
              style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
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
  final BnaSubjectListController bnaSubjectListController=Get.put(BnaSubjectListController());
  final TraineeMarkListController traineeMarkListController=Get.put(TraineeMarkListController());
    final QexamCourseDetailController qexamCourseDetailController=Get.put(QexamCourseDetailController());

  void buildDataGridRow() {
    dataGridRows = QexamDataList.asMap().entries.map<DataGridRow>((entry) {
      int index= entry.key;
      QExam datarows=entry.value;
      List<Widget> actionWidgets = [
        InkWell(
            onTap: () async {
              await bnaSubjectListController.getBnaSubjectListData().then((_){
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => BnaSubjectView(),
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
              await qexamCourseDetailController.getcourseDetail(cDurationId:datarows.courseDurationId);
              await traineeMarkListController
                  .getQexamMarkListData(courseDurationId:datarows.courseDurationId)
                  .then((_) {
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => TraineeMarkListView(
                      ),
                ));
              });



            },
            child: Text('ViewMarkSheet',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
      ];
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'Course', value: '${datarows.course}- ${datarows.courseTitle}'),
        DataGridCell<DateTime>(columnName: 'Duration', value:datarows.durationFrom ),
        DataGridCell<DateTime>(columnName: 'Duration', value:datarows.durationTo),
        DataGridCell<int>(columnName: 'Candidates', value: datarows.candidates ),
        DataGridCell<Widget>(columnName: 'Action', value: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: actionWidgets))),

      ]);
    }).toList(growable: false);
  }
}
