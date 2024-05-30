import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;


import '../../QExam/View/qExam_page.dart';
import '../../traineeNomination/controller/trinee_nomination_controller.dart';
import '../../traineeNomination/views/Foreign_course_trainee_nominee_screen.dart';
import '../controller/Course_week_controller.dart';
import '../model/Course_week_duration_model.dart';




class CourseWeek extends StatefulWidget {
  CourseWeek({super.key});

  @override
  State<CourseWeek> createState() => _CourseWeekState();
}

class _CourseWeekState extends State<CourseWeek> {
  final CourseWeekController controller = Get.put(CourseWeekController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) => controller.forCourseSearch.clear(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              controller.forCourseSearch

                  .clear();
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Course Week",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red)),
        ),

        body: SfDataGridTheme(
          data:  SfDataGridThemeData(
              headerColor: Colors.indigoAccent,
              gridLineColor: Colors.green, gridLineStrokeWidth: 5.0,),
          // headerColor: const Color(0xff009889), child: null,),
          child: Column(
              mainAxisSize: MainAxisSize.max,


              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    color: Colors.white10,
                    height: 50,

                    child: CupertinoSearchTextField(
                      onChanged: (value) {
                        setState(() {
                         controller.searchforCourse(value);
                        }); // Call search function in the controller
                      },
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Expanded(
                  child: SfDataGrid(
                      source: LocalCourseGridSource(controller.courseByWeekDetailsList,controller),
                      columns: getColumns(),
                    gridLinesVisibility: GridLinesVisibility.both,
                    headerGridLinesVisibility: GridLinesVisibility.both,
                    columnWidthMode: ColumnWidthMode.fill,
                    rowHeight: 65,),

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
      minimumWidth: 150,
      columnName: 'Weeks',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('Weeks',
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
      minimumWidth: 180,
      columnName: 'Start Date',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Start Date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 180,
      columnName: 'End Date',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('End Date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 120,
      columnName: 'Remarks',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Remarks', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 200,
      columnName: 'Status',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
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
  LocalCourseGridSource(this.CourseWeekDataList,this.controller) ;
  final CourseWeekController controller;

  late List<CourseWeekDurationModel> CourseWeekDataList;
  late List<DataGridRow> dataGridRows;
 // final TraineeNominationController traineeNominationController = Get.put(TraineeNominationController());

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {


    return DataGridRowAdapter(
        color: Colors.white,
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
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              intl.DateFormat.yMMMd().format(row.getCells()[1].value),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3.0),
            child: Text(

             intl.DateFormat.yMMMd().format( row.getCells()[2].value),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3.0),
              child: Text(
                row.getCells()[3].value.toString(),
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              )
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(14.0),
            child: Text(
                row.getCells()[4].value.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
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
  List<DataGridRow> get rows  {
    List<CourseWeekDurationModel> listToUse = controller.forCourseSearch.isNotEmpty ? controller.forCourseSearch : CourseWeekDataList;

    return listToUse.asMap().entries.map<DataGridRow>((entry) {
      // List<Widget> actionWidgets = [];
      CourseWeekDurationModel dataRows = entry.value;
      String getStatus() {
        DateTime currentDate = DateTime.now();

        if (dataRows.status == 1) {
          return "Completed";
        } else if (dataRows.status == 0 && currentDate.isAfter(dataRows.dateTo!)) {
          return "Passed week";
        } else if (dataRows.status == 0 && currentDate.isBefore(dataRows.dateFrom!)) {
          return "Upcoming" ;
        } else if (dataRows.status == 0 && currentDate.isAfter(dataRows.dateFrom!) && currentDate.isBefore(dataRows.dateTo!)) {
          return "Running";
        }
        // Add a default return value in case none of the conditions are met
        return "Status unknown";
      }



      return DataGridRow(cells: [

        DataGridCell<String>(columnName: 'Weeks', value: dataRows.weekName),
        DataGridCell<DateTime>(columnName: 'Start Date', value: dataRows.dateFrom ),
        DataGridCell<DateTime>(columnName: 'End Date', value: dataRows.dateTo ),
        DataGridCell<String>(columnName: 'Remarks', value: dataRows.remarks.toString()=="null"?" ":dataRows.remarks ),
        DataGridCell<String>(columnName: 'Status',value: getStatus()),

      ]);
    }).toList(growable: false);
  }
}

