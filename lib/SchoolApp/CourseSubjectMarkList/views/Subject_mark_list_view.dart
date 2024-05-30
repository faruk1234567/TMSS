import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../../CourseSubjectMarkList/controller/ourse_subjectMarkList_controller.dart';
import '../model/curse_subject_marklist_model.dart';











class SubjectMarkListView extends StatelessWidget {
  SubjectMarkListView({super.key});

  final CourseSubjectMarkListController controller=Get.put(CourseSubjectMarkListController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subject mark List",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red)),
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
                    source: LocalCourseGridSource(controller.CourseBySubjectListList),
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
      minimumWidth: 300,
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
      minimumWidth: 150,
      columnName: 'TotalMark',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('TotalMark', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
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

  late List<SubjectMarkListModel> LocalCourseDataList;
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
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(

              row.getCells()[2].value.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
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
      SubjectMarkListModel dataRows = entry.value;

      int index = entry.key;






      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'Mark Type', value: '${dataRows.markType}'),
        DataGridCell<String>(columnName: 'Total Mark', value: '${dataRows.mark}'),






      ]);
    }).toList(growable: false);
  }
}

