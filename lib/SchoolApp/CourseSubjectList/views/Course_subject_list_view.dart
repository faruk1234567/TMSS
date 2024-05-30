import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../../CourseSubjectMarkList/controller/ourse_subjectMarkList_controller.dart';
import '../../CourseSubjectMarkList/views/Subject_mark_list_view.dart';
import '../controller/subject_list_controller.dart';
import '../model/course_subject_list.model.dart';










class SchoolCourseSubjectView extends StatelessWidget {
  SchoolCourseSubjectView({super.key});

  final SchoolCourseSubjectController controller=Get.put(SchoolCourseSubjectController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Subject List",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)),
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
              Column(
                
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text('Name of the Course',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo)),
                        Text('${controller.NameOfTheCourse.value.course}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red))
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: SfDataGrid(
                    source: LocalCourseGridSource(controller.CourseBySubjectListList),
                    columns: getColumns(),
                    gridLinesVisibility: GridLinesVisibility.both),
              ),
              Container(
                height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox
                        (width: 200, child: Text('Total',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red))),
                      Divider(
                        height: 20,

                      ),
                     // SizedBox( width: 200,child: Text((controller.SubTotalMark[0].totalPeriod.toStringAsFixed(0)).toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red))),
                      SizedBox( width: 200,child: Text(controller.SubTotalMark[0].totalPeriod.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red))),
                      Divider(
                        height: 20,
                      ),
                     // SizedBox(width: 200 ,child: Text((controller.SubTotalMark[0].totalMark.toStringAsFixed(0)).toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red))),
                      SizedBox(width: 200 ,child: Text(controller.SubTotalMark[0].totalMark.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red))),
                    //  Text((controller.SubTotalMark[0].passMark.toStringAsFixed(0)).toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red)),
                      Text(controller.SubTotalMark[0].passMark.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red)),

                      SizedBox(height: 20,)



                    ],

                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              
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
      columnName: 'Module',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: const Text('Module',
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
      minimumWidth: 300,
      columnName: 'Subject Name',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: const Text('Subject Name',
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
      columnName: 'SubjectType',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('SubjectType', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 250,
      columnName: 'Total Perioud',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Total Perioud', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 150,
      columnName: 'Total Mark',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Total Mark', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 150,
      columnName: 'Pass Mark',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Pass Mark', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 300,
      columnName: 'Actions',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: const Text('Actions',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25),
            overflow: TextOverflow.clip,
            softWrap: true

        ),
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
  LocalCourseGridSource(this.LocalCourseDataList) {
    buildDataGridRow();
  }

  late List<SchoolCourseSubjectListModel> LocalCourseDataList;
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
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
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
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[2].value.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[3].value.toString(),
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[4].value.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[5].value.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[6].value.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(3.0),
            child: row.getCells()[7].value,
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


  void buildDataGridRow() {
    dataGridRows = LocalCourseDataList.asMap().entries.map<DataGridRow>((entry) {
      // List<Widget> actionWidgets = [];
      SchoolCourseSubjectListModel dataRows = entry.value;
      final CourseSubjectMarkListController courseSubjectMarkListController=Get.put(CourseSubjectMarkListController());
      int index = entry.key;


      List<Widget> actionWidgets = [



        InkWell(
            onTap: () async {
              await courseSubjectMarkListController.getSchSubjectMarkeList(
                  courseNameId:dataRows.courseNameId,bnaSubjectNameId:dataRows.bnaSubjectNameId).then
                ((_){
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => SubjectMarkListView(),
                )
                );

              }
              );

            },


            child:  Text('Subject MarkList', style: TextStyle(
                fontWeight:  FontWeight.bold,fontSize: 20,color: Colors.red))),
      ];



      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'Subject Name', value: '${dataRows.courseModule}'),
        DataGridCell<String>(columnName: 'Subject Name', value: '${dataRows.subjectName}'),
        DataGridCell<String>(columnName: 'Subject Type', value: '${dataRows.subjectType}'),
        DataGridCell<String>(columnName: 'Total Period', value: '${dataRows.totalPeriod}'),
        DataGridCell<String>(columnName: 'Total Mark', value: '${dataRows.totalMark}'),
        DataGridCell<String>(columnName: 'Pass Mark', value: '${dataRows.passMarkBna}'),
        DataGridCell<Widget>(columnName: 'Action', value: Row(children: actionWidgets)),




      ]);
    }).toList(growable: false);
  }


}

