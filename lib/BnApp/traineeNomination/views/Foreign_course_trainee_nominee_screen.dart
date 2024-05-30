import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;


import '../../QExam/View/qExam_page.dart';
import '../controller/trinee_nomination_controller.dart';
import '../models/trainee_nomination_model.dart';




class FcourseTraineeNomination extends StatelessWidget {
  FcourseTraineeNomination({super.key});

  final TraineeNominationController controller = Get.put(TraineeNominationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TraineeNomiNation',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
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
              /*Row(
                children: [
                  Text('Course :'),
                  Text(controller.traineeNominationList[0].course!),
                ],
              ),*/
              Expanded(
                child: SfDataGrid(
                    source: LocalCourseGridSource(controller.traineeNominationList),
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
      minimumWidth: 200,
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
      minimumWidth: 200,
      columnName: 'PNO/\nONO',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text('PNO/ONO',
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
      minimumWidth: 450,
      columnName: 'Name',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 200,
      columnName: 'Rank',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Rank', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 250,
      columnName: 'Attendence( %)',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Attendence (%)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 200,
      columnName: 'Result',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Result', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),

    GridColumn(
      minimumWidth: 350,
      columnName: 'Certificate BackPage',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Certificate BackPage', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 300,
      columnName: 'Certificate',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Certificate', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
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

  late List<TraineeNominationModel> LocalCourseDataList;
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
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(14.0),
            child: row.getCells()[6].value,

          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(14.0),
            child: row.getCells()[7].value,

          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(14.0),
            child: row.getCells()[8].value,

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
  final TraineeNominationController foreignController=Get.put(TraineeNominationController());

  void buildDataGridRow() {
    dataGridRows = LocalCourseDataList.asMap().entries.map<DataGridRow>((entry) {
      // List<Widget> actionWidgets = [];
      TraineeNominationModel dataRows = entry.value;
      int index= entry.key;
      List<Widget> actionWidgets = [



        InkWell(
            onTap: () async {
              await foreignController.getNomineeData(

              ).then((_){
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => QexamPage(),
                )
                );





              }
              );
            },

            child: Text('SubjectMark',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),)),
      ];
      List<Widget> actionWidgetsone = [



        InkWell(
            onTap: () async {
              await foreignController.getNomineeData(

              ).then((_){
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => QexamPage(),
                )
                );





              }
              );
            },

            child: Text('Parformance Detail',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),)),
      ];
      List<Widget> actionWidgetstwo = [



        InkWell(
            onTap: () async {
              await foreignController.getNomineeData(

              ).then((_){
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => QexamPage(),
                )
                );





              }
              );
            },

            child: Text('Parformance Detail',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),)),
      ];


      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'Course ', value: '${dataRows.course}- ${dataRows.courseTitle}'),
        DataGridCell<String>(columnName: 'PNO/ONO  ', value: dataRows.pno),
        DataGridCell<String>(columnName: 'Name', value: dataRows.name ),
        DataGridCell<String>(columnName: 'Rank', value: dataRows.position ),
        DataGridCell<int>(columnName: 'Attendence(%)', value: dataRows.percentage ),
        DataGridCell<Widget>(columnName: 'Result', value: Row(children: actionWidgets)),
        DataGridCell<Widget>(columnName: 'Certificat Backpage', value: Row(children: actionWidgetsone)),
        DataGridCell<Widget>(columnName: 'Certificat ', value: Row(children: actionWidgetstwo)),

      ]);
    }).toList(growable: false);
  }
}

