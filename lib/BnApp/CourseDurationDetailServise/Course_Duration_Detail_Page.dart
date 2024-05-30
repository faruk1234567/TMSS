import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../LocalCourseServise/LocalCourse_Controller.dart';
import '../LocalCourseServise/LocalCourse_model.dart';
import 'Course_Duration_Detail_Controller.dart';
import 'Course_Duration_Detail_model.dart';

class CourseDurationDetailsPage extends StatefulWidget {
  CourseDurationDetailsPage({super.key});

  @override
  State<CourseDurationDetailsPage> createState() => _CourseDurationDetailsPageState();
}

class _CourseDurationDetailsPageState extends State<CourseDurationDetailsPage> {
  final CourseDurtionDetailController controller = Get.put(CourseDurtionDetailController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) => controller.forInstructorSearch.clear(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              controller.forInstructorSearch.clear();
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("instractor Information",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
        ),
        body: SfDataGridTheme(
          data:  SfDataGridThemeData(
              headerColor: Colors.blueGrey,
              gridLineColor: Colors.black, gridLineStrokeWidth: 3.0),
             // headerColor: const Color(0xff009889), child: null,),
          child:
                 Column(
                  mainAxisSize: MainAxisSize.max,


                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    color: Colors.white10,

                    child: CupertinoSearchTextField(
                      onChanged: (value) {
                        setState(() {
                          controller.searchInstructor(value);
                        }); // Call search function in the controller
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Expanded(
                  child: SfDataGrid(
                    source: LocalCourseGridSource(controller.courseDurationDetailsList,controller),
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
                fontSize: 25),
            overflow: TextOverflow.clip,
            softWrap: true
        ),
      ),
    ),

    GridColumn(
      minimumWidth: 300,
      columnName: 'name',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('Instructor',
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
      columnName: 'ShortCode',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('ShortCode', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 550,
      columnName: 'subjectname',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('SubjectName', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 350,
      columnName: 'SSName',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('SSName', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
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
  LocalCourseGridSource(this.LocalCourseDataList,this.controller) ;
  final CourseDurtionDetailController controller;

  late List<GetCourseDurationDetailList> LocalCourseDataList;
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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(3.0),
        child: Text(
          row.getCells()[2].value.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(3.0),
        child: Text(
          row.getCells()[3].value.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5.0),
          child: Text(
            row.getCells()[4].value.toString(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          )
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
    List<GetCourseDurationDetailList> listToUse = controller.forInstructorSearch.isNotEmpty ? controller.forInstructorSearch : LocalCourseDataList;

    return listToUse.asMap().entries.map<DataGridRow>((entry)  {
      int index = entry.key;
      GetCourseDurationDetailList datarows=entry.value;

      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'name', value: '${datarows.position.toString()=="null"?" ": datarows.position}  ${datarows.name}\n(P No ${datarows.pno})'),
        DataGridCell<String>(columnName: 'shortCode', value: datarows.shortCode.toString()=="null"?" ": datarows.shortCode ),
        DataGridCell<String>(columnName: 'subjectname', value: '${datarows.subjectname}(${datarows.shortName}) '),
        DataGridCell<String>(columnName: 'subjectShortName', value: datarows.subjectShortName ),

      ]);
    }).toList(growable: false);
  }
}

