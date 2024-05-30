import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../Controller/inter_servise_controller.dart';
import '../model/inter_Servise_model.dart';





class InterServiseCourses extends StatelessWidget {
  InterServiseCourses({super.key});

  final InterServiseController controller = Get.put(InterServiseController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inter Service Runnung Courses"),
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
                    source: LocalCourseGridSource(controller.InterServiseCourseList),
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
      minimumWidth: 350,
      columnName: 'CourseName',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('CourseName',
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
      minimumWidth: 150,
      columnName: 'OrganazationName',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('OrganazationName', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 550,
      columnName: 'DurationFrom',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('DurationFrom', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 500,
      columnName: 'DurationTo',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('DurationTo', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 50,
      columnName: 'Action',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Action', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent, fontSize: 25)),
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
  LocalCourseGridSource(this.InterSerViseCourseDataList) {
    buildDataGridRow();
  }

  late List<InterServiseCourse> InterSerViseCourseDataList;
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
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[0].value.toString(),
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[1].value.toString(),
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[2].value.toString(),
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3.0),
              child: Text(
                row.getCells()[3].value.toString(),
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              )
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(14.0),
            child: row.getCells()[4].value,
            color: Colors.green,
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
    dataGridRows = InterSerViseCourseDataList.asMap().entries.map<DataGridRow>((entry){
      InterServiseCourse dataRows=entry.value;
      //  dataGridRows = LocalCourseDataList.asMap().entries.map<DataGridRow>((entry){
      List<Widget> actionWidgets = [



        InkWell(
            onTap: ()  {
              /*await traineeNominationController.getNomineeData(courseDurationId: dataRows.courseDurationId).then((_){
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => FcourseTraineeNomination(),
                )
                );





              }
              );*/
            },

            child: CircleAvatar(radius: 12, child: Icon(Icons.visibility))),
      ];

      return DataGridRow(cells: [

        DataGridCell<String>(columnName: 'CourseName', value: dataRows.course),
        DataGridCell<String>(columnName: 'Organization Name', value: dataRows.orgName ),
        DataGridCell<DateTime>(columnName: 'DurationFrom', value: dataRows.durationFrom ),
        DataGridCell<DateTime>(columnName: 'DurationTo', value: dataRows.durationTo),
         DataGridCell<Widget>(columnName: 'Action', value:Row(children: actionWidgets)),

      ]);
    }).toList(growable: false);
  }
}

