import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../controller/SubjectMarkList_controller.dart';
import '../model/subjectMarkList_model.dart';



class MarkDataList extends StatelessWidget {
  MarkDataList({
    super.key,
  });
  final SubjectMarkListController Controller = Get.put(SubjectMarkListController());
  //String? schoolName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subject Mark List",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: SfDataGridTheme(
        data: SfDataGridThemeData(
            headerColor: const Color(0xff009889),
            gridLineColor: Colors.black,
            gridLineStrokeWidth: 2.0),
        // headerColor: const Color(0xff009889), child: null,),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  /*  Row(
                    children: [
                      Text('School: '),
                      Text(controlerCourse.courseDurationDetailsList[0].schoolName!),
                    ],

                  ),*/
                  /* Row(
                    children: [
                      Text('Course :'),
                      Text(controlerCourse.courseDurationDetailsList[1].course! + controlerCourse.courseDurationDetailsList[1].course!),
                    ],
                  )*/
                ],
              ),
              Expanded(
                child: SfDataGrid(
                    source: LocalCourseGridSource(Controller.getsubjctMarkList),
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
        child: const Text('Ser:No',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
            overflow: TextOverflow.clip,
            softWrap: true),
      ),
    ),

    GridColumn(
      minimumWidth: 250,
      columnName: 'MarkType',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('MarkType',
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
      columnName: 'TotalMark',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('TotalMark',
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
      columnName: 'PassMark',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('PassMark',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true),
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
  LocalCourseGridSource(this.TotalMarkList) {
    buildDataGridRow();
  }

  late List<MarkListBySubject> TotalMarkList;
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
    dataGridRows = TotalMarkList.asMap().entries.map<DataGridRow>((entry) {
      int index = entry.key;
      MarkListBySubject datarows = entry.value;

      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(
            columnName: 'MarkType', value: datarows.markType),
        DataGridCell<dynamic>(
            columnName: 'Total Mark', value: datarows.mark),
        DataGridCell<dynamic>(
            columnName: 'Total Mark', value: datarows.passMark),

      ]);
    }).toList(growable: false);
  }
}
