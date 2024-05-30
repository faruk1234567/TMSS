import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../controller/Create_nomination_controller.dart';
import '../model/create_trainee_nom_model.dart';



class cTraineeNomiPage extends StatelessWidget {
  cTraineeNomiPage({super.key});

  final CreateNomiController controller =
  Get.put(CreateNomiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Trainee Nomination ",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
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
              Column(
                children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                      children: [
                        Text('School: ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.indigo)),
                        Text(controller.CnominationDetails[0].schoolName!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                      ],

                                        ),
                    ),
                   SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child: Row(
                      children: [
                        Text('Course :',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.indigo)),
                        Text(controller.CnominationDetails[0 ].courseName!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)) ,Text( controller.CnominationDetails[0 ].courseDuration!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                      ],
                                       ),
                   )
                ],
              ),
              Expanded(
                child: SfDataGrid(
                    source:
                    LocalCourseGridSource(controller.CnominationDetails),
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
      minimumWidth: 200,
      columnName: 'P. No',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('P. No',
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
      minimumWidth: 250,
      columnName: 'Name',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Name',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 150,
      columnName: 'Rank',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Rank',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 150,
      columnName: 'Attandance Parcentage',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Attandance Parcentage',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25)),
      ),
    ),
   /* GridColumn(
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
    ),*/

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
  LocalCourseGridSource(this.CTraineeNomiDataList) {
    buildDataGridRow();
  }

  late List<Items> CTraineeNomiDataList;
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
          row.getCells()[2].value.toString(),
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(3.0),
        child: Text(
          row.getCells()[3].value.toString(),
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
     /* Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(15.0),
        child: row.getCells()[5].value,
        color: Colors.indigo,
      ),*/

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


  void buildDataGridRow() {
    dataGridRows =
        CTraineeNomiDataList.asMap().entries.map<DataGridRow>((entry) {
          Items dataRows = entry.value;
          int index = entry.key;
         /* List<Widget> actionWidgets = [
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
          ];*/
          return DataGridRow(cells: [
            DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
            DataGridCell<String>(
                columnName: 'Course',
                value: '${dataRows.traineePNo} '),
            DataGridCell<String>(
                columnName: 'Name', value: dataRows.traineeName),
            DataGridCell<String>(
                columnName: 'Rank', value: dataRows.rankPosition.toString()=="null"?" AB":dataRows.rankPosition),
            DataGridCell<String>(columnName: 'Candidates', value:' ${dataRows.courseAttendState}%'),
            /*DataGridCell<Widget>(
                columnName: 'Action',
                value: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: actionWidgets))),*/
          ]);
        }).toList(growable: false);
  }
}
