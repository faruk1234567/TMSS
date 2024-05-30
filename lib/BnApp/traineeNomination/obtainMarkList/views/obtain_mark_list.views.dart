import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../../../CourseDurationDetailServise/Course_Duration_Detail_Controller.dart';
import '../../controller/trinee_nomination_controller.dart';
import '../controller/obtain_marklist_controller.dart';
import '../model/obtain_marklist_model.dart';












class ObtainMarkListScreen  extends StatefulWidget {
  ObtainMarkListScreen({super.key,required this.schoolName,
    required this.courseName,required this.trainee,});
  String? schoolName;
  String? courseName;
  String? trainee;

  @override
  State<ObtainMarkListScreen> createState() => _ObtainMarkListScreenState();
}

class _ObtainMarkListScreenState extends State<ObtainMarkListScreen> {
  final ObtainMarkListController controllerOc = Get.put(ObtainMarkListController());

  final TraineeNominationController controller = Get.put(TraineeNominationController());

  final CourseDurtionDetailController controlerCourse=Get.put(CourseDurtionDetailController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) => controllerOc.forObTMarkListSearch.clear(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              controllerOc.forObTMarkListSearch.clear();
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Obtain MarkList",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
        ),

        body: SfDataGridTheme(
          data:  SfDataGridThemeData(
              headerColor: Colors.blueGrey,
              gridLineColor: Colors.black, gridLineStrokeWidth: 3.0),
          // headerColor: const Color(0xff009889), child: null,),
          child: Column(
              mainAxisSize: MainAxisSize.max,


              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(

                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Trainee: ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                          Text('${widget.trainee}',
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo)),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Course : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                          Text('${widget.courseName}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo)),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const Text('School Name : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                          Text('${widget.schoolName}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo)),
                        ],

                      ),
                    )

                  ],
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    color: Colors.white10,

                    child: CupertinoSearchTextField(
                      onChanged: (value) {
                        setState(() {
                          controllerOc.searchObtainMarkList(value);
                        }); // Call search function in the controller
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: SfDataGrid(
                      source: LocalCourseGridSource(controllerOc.obtainMarkList,controllerOc),
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
      minimumWidth: 480,
      columnName: 'SubjectName',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('SubjectName',
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
    GridColumn(
      minimumWidth: 150,
      columnName: 'PassMark',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('PassMark', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 200,
      columnName: 'ObtainMark',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('ObtainMark', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 200,
      columnName: 'ExamStatus',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('ExamStatus', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
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
  LocalCourseGridSource(this.ObtainMarkDataList,this.controllerOc);
  ObtainMarkListController controllerOc;

  late List<ObtainMarkList> ObtainMarkDataList;
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
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3.0),
              child: Text(
                row.getCells()[4].value.toString(),
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              )
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3.0),
              child: Text(
                row.getCells()[5].value.toString(),
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
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
    List<ObtainMarkList> listToUse = controllerOc.forObTMarkListSearch.isNotEmpty ? controllerOc.forObTMarkListSearch : ObtainMarkDataList;

    return listToUse.asMap().entries.map<DataGridRow>((entry) {
      int index= entry.key;
      ObtainMarkList datarows= entry.value;



      return DataGridRow(cells: [

        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'Subject Name', value: datarows.subjectName),
        DataGridCell<String>(columnName: 'Total Mark', value:datarows.totalMark ),
        DataGridCell<String>(columnName: 'Pass Mark', value:datarows.passMarkBna),
        DataGridCell<dynamic>(columnName: 'Obtain Mark', value:datarows.obtaintMark.toString()=="null"?"" :datarows.obtaintMark ),
        DataGridCell<dynamic>(columnName: 'Exam Status', value:datarows.reExamStatus.toString()=="null"?"":"Regular"),



      ]);
    }).toList(growable: false);
  }
}

