import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../controller/School_weekly_controller.dart';
import '../model/weekly_model.dart';







class SchoolWeeklyListViews extends StatelessWidget {
  SchoolWeeklyListViews({super.key});

  final SchoolWeeklyController controller=Get.put(SchoolWeeklyController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weekly Programe List"),
      ),
      body: SfDataGridTheme(
        data:  SfDataGridThemeData(
            headerColor: const Color(0xff009889),
            gridLineColor: Colors.black, gridLineStrokeWidth: 2.0),
        // headerColor: const Color(0xff009889), child: null,),
        child: Obx(
              () => Column(
            mainAxisSize: MainAxisSize.max,


            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SfDataGrid(
                    source: LocalCourseGridSource(controller.SchoolWList),
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
      columnName: 'Ser.No',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: const Text(
          'Ser:No',
        ),
      ),
    ),
    GridColumn(
      minimumWidth: 300,
      columnName: 'Course',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('Course',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
              fontSize: 25,
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true),
      ),
    ),
    GridColumn(
      minimumWidth: 800,
      columnName: 'Course Duration',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Course Duration', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent, fontSize: 25)),
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
  LocalCourseGridSource(this.LocalCourseDataList) {
    buildDataGridRow();
  }

  late List<SchoolWeeklyModel> LocalCourseDataList;
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
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[1].value.toString(),
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[2].value.toString(),
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
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
  List<DataGridRow> get rows => dataGridRows;


  void buildDataGridRow() {
    dataGridRows = LocalCourseDataList.asMap().entries.map<DataGridRow>((entry) {
      // List<Widget> actionWidgets = [];
      SchoolWeeklyModel dataRows = entry.value;
      int index = entry.key;



      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'Course', value: '${dataRows.course}- ${dataRows.courseTitle}'),
        DataGridCell<String>(columnName: 'Course Duration', value: '${dataRows.durationFrom}- ${dataRows.durationTo}'),




      ]);
    }).toList(growable: false);
  }
}

