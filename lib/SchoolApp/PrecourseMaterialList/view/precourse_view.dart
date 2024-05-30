import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../../CourseSubjectList/controller/subject_list_controller.dart';
import '../../CourseSubjectList/views/Course_subject_list_view.dart';
import '../../courseList/controller/Course_named_controller.dart';
import '../controller/precourse_material_controller.dart';
import '../model/Precourse_material_list.dart';

class PrecourseListView extends StatefulWidget {
  PrecourseListView({super.key});

  @override
  State<PrecourseListView> createState() => _PrecourseListViewState();
}

class _PrecourseListViewState extends State<PrecourseListView> {
  final PrecourseController controller = Get.put(PrecourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PreCourse Material List",style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.indigo)),
      ),
      body: SfDataGridTheme(
        data: SfDataGridThemeData(
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
                    source: LocalCourseGridSource(controller.precourseList,controller),
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
                fontSize: 25),
            overflow: TextOverflow.clip,
            softWrap: true
        ),
      ),
    ),
    GridColumn(
      minimumWidth: 250,
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
      minimumWidth: 150,
      columnName: 'Material',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('Material',
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
      columnName: 'Actions',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: const Text('Actions',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.pink, fontSize: 25),
            overflow: TextOverflow.clip,
            softWrap: true),
      ),
    )

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
  final PrecourseController controller;

  late List<PreCourseMaterialModel> LocalCourseDataList;
  late List<DataGridRow> dataGridRows;
  //final TraineeNominationController traineeNominationController = Get.put(TraineeNominationController());

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
        padding: const EdgeInsets.all(3.0),
        child: Text(
          row.getCells()[0].value.toString(),
          style: const TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(3.0),
        child: Text(
          row.getCells()[1].value.toString(),
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(3.0),
        child: Text(
          row.getCells()[2].value.toString(),
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(14.0),
        child: row.getCells()[3].value,
        color: Colors.indigo,
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
  List<DataGridRow> get rows  {
    List<PreCourseMaterialModel> listToUse = controller.searchList.isNotEmpty ? controller.searchList : LocalCourseDataList;
    return listToUse.asMap().entries.map<DataGridRow>((entry) {
      // List<Widget> actionWidgets = [];
      PreCourseMaterialModel dataRows = entry.value;
      int index = entry.key;
      //  final SchoolCourseSubjectController schoolCourseSubjectController=Get.put(SchoolCourseSubjectController());
      List<Widget> actionWidgets = [
        InkWell(
            onTap: () async {
              /*await schoolCourseSubjectController.getSchSubjectCourseList(
                  courseNameId:dataRows.courseNameId).then
                ((_){
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => SchoolCourseSubjectView(),
                )
                );

              }
              );*/
            },
            child: Text('Details',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red))),
      ];

      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'Course', value: '${dataRows.course}'),
        DataGridCell<String>(
            columnName: 'Mateial', value: '${dataRows.materialCount}'),
        DataGridCell<Widget>(
            columnName: 'Action', value: Row(children: actionWidgets)),
      ]);
    }).toList(growable: false);
  }
}
