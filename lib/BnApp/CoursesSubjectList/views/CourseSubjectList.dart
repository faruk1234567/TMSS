import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../../GetCourseNameDetail/contrller/get_course_named_detail.controller.dart';
import '../CourseNameDetail/controller/Course_name_detail_controller.dart';
import '../SubjectMarklist/controller/SubjectMarkList_controller.dart';
import '../SubjectMarklist/model/subjectMarkList_model.dart';
import '../SubjectMarklist/view/SubjectMarkList_view.dart';
import '../controller/Course_subject_list_controller.dart';
import '../model/Course_subject_List_model.dart';











class CourseSubjectList extends StatelessWidget {
  CourseSubjectList({super.key});

  final CourseSubjectListController controller = Get.put(CourseSubjectListController());
 final GetCourseNamedDetailController getCourseNamedDetailController=Get.put(GetCourseNamedDetailController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Subject List",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: SfDataGridTheme(
        data:  SfDataGridThemeData(
            headerColor: const Color(0xff009889),
            gridLineColor: Colors.black, gridLineStrokeWidth: 2.0),
        // headerColor: const Color(0xff009889), child: null,),
        child: Obx(
              () =>getCourseNamedDetailController.isLoading.value?CircularProgressIndicator(): Column(
            mainAxisSize: MainAxisSize.max,


            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Name Of The Course:-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                    Text('${getCourseNamedDetailController.gcourseNaamedDetails.value.course}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                  ],

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SfDataGrid(
                    source: LocalCourseGridSource(controller.courseBySubjectLisst),
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
      minimumWidth: 180,
      columnName: 'Module',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
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
      minimumWidth: 220,
      columnName: 'SubjectName',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('SubjectName', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 300,
      columnName: 'SubjectType',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('SubjectType', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 220,
      columnName: 'Total Period',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Total Period', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 200,
      columnName: 'Total Mark',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Total Mark', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),

    GridColumn(
      minimumWidth: 200,
      columnName: 'Pass Mark',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Pass Mark', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),

    GridColumn(
      minimumWidth: 250,
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
  LocalCourseGridSource(this.SubjectCourseDataList) {
    buildDataGridRow();
  }

  late List<CoursesSubjectList> SubjectCourseDataList;
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
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[2].value.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[3].value.toString(),
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
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3.0),
              child: Text(
                row.getCells()[5].value.toString(),
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              )
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3.0),
              child: Text(
                row.getCells()[6].value.toString(),
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              )
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(14.0),
            child: row.getCells()[7].value,width: 20,height: 20,
            //color: Colors.green,
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
  SubjectMarkListController subjectMarkListController = Get.put(SubjectMarkListController());


  void buildDataGridRow() {
    dataGridRows = SubjectCourseDataList.asMap().entries.map<DataGridRow>((entry) {
      int index = entry.key;
      CoursesSubjectList dataRows =entry.value;


      List<Widget> actionWidgets = [



        InkWell(
            onTap: () async{
              await subjectMarkListController.getSubjectMarkListData(baseSchoolNameId:dataRows.baseSchoolNameId,courseNameId:dataRows.courseNameId,bnaSubjectNameId:dataRows.bnaSubjectNameId).then((_) {
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => MarkDataList(),
                )
                );

              }
              );

            },


            child:  Text('SubjectMarkList', style: TextStyle(
                fontWeight:  FontWeight.bold,fontSize: 20,color: Colors.red))),
      ];
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'Module', value: dataRows.courseModule),
        DataGridCell<String>(columnName: 'Subject Name', value:dataRows.subjectName ),
        DataGridCell<String>(columnName: 'Subject Type', value:dataRows.subjectType),
        DataGridCell<String>(columnName: 'Total Period', value: dataRows.totalPeriod ),
        DataGridCell<String>(columnName: 'Total Mark', value:dataRows.totalMark),
        DataGridCell<String>(columnName: 'Pass Mark', value: dataRows.passMarkBna ),
        DataGridCell<Widget>(columnName: 'Action',value: Row(children: actionWidgets)),

      ]);
    }).toList(growable: false);
  }
}

