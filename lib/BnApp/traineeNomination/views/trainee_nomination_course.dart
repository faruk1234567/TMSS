import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../TraineeAttendenseList/TAttendenseController/trainee_attendense_controller.dart';
import '../TraineeAttendenseList/TAttendenseViews/trainee_attendense_date_search.dart';
import '../TraineeBiodataDetail/controller/trainee_bio_controller.dart';
import '../TraineeBiodataDetail/views/bioData_page.dart';
import '../TraineeCerificate/controller/trainee_certificate_controller.dart';
import '../TraineeParformance/controller/performance_controller.dart';
import '../TraineeParformance/views/performe_report.dart';
import '../controller/trinee_nomination_controller.dart';
import '../models/trainee_nomination_model.dart';
import '../obtainMarkList/controller/obtain_marklist_controller.dart';
import '../obtainMarkList/views/obtain_mark_list.views.dart';
import 'Certificate_screen.dart';











class TraineeNominationScreenOne extends StatefulWidget {
  TraineeNominationScreenOne({super.key,required this.schoolName});
  String? schoolName;

  @override
  State<TraineeNominationScreenOne> createState() => _TraineeNominationScreenOneState();
}

class _TraineeNominationScreenOneState extends State<TraineeNominationScreenOne> {
  final TraineeNominationController controller = Get.put(TraineeNominationController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) => controller.forTraineeNomiSearch.clear(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              controller.forTraineeNomiSearch.clear();
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Trainee Nomination"),
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

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('School: ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                          Text(widget.schoolName! ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo)),
                        ],

                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Course : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                          controller.traineeNominationList.isEmpty ? Text('') : Text(controller.traineeNominationList[0].course! + controller.traineeNominationList[0].courseTitle!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo)),


                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    color: Colors.white10,

                    child: CupertinoSearchTextField(
                      onChanged: (value) {
                        setState(() {
                          controller.searchTraineeNomination(value);
                        }); // Call search function in the controller
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,

                ),
                Expanded(
                  child: SfDataGrid(
                      source: LocalCourseGridSource(controller.traineeNominationList,
                      controller.traineeNominationList.isEmpty ? "" : controller.traineeNominationList[0].course! + controller.traineeNominationList[0].courseTitle!, widget.schoolName!,controller),
                      columns: getColumns(),
                      gridLinesVisibility: GridLinesVisibility.both),
                )
                //headerGridLinesVisibility: GridLinesVisibility.both),

              ],
            ),
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
      minimumWidth: 150,
      columnName: 'PNO/ONO',
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
      minimumWidth: 350,
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
      minimumWidth: 150,
      columnName: 'Attendence',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Attendence', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 130,
      columnName: 'Result',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Result', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 300,
      columnName: 'Certificate\n BackPage',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Certificate BackPage', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),

    GridColumn(
      minimumWidth: 150,
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
  LocalCourseGridSource(this.TraineeNominationDataList, this.courseName, this.schoolName,this.controller) ;
  final TraineeNominationController controller;

  late List<TraineeNominationModel> TraineeNominationDataList;
  late List<DataGridRow> dataGridRows;
  late String courseName;
  late String schoolName;



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
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: row.getCells()[1].value,
            //color: Colors.indigo,


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
            padding: const EdgeInsets.all(8.0),
            child: row.getCells()[4].value,
            //color: Colors.indigo,


          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(14.0),
            child: row.getCells()[5].value,

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
  List<DataGridRow> get rows {
  final ObtainMarkListController obtainMarkListController=Get.put(ObtainMarkListController());
  final TraineeParformanceController traineeParformanceController=Get.put(TraineeParformanceController());
  final TraineeAttendenseController  traineeAttendenseController=Get.put(TraineeAttendenseController());
  final CertificateValueController certificateValueController = Get.put(CertificateValueController());
  final trineeBioDataListController  tbController=Get.put(trineeBioDataListController());

  List<TraineeNominationModel> listToUse = controller.forTraineeNomiSearch.isNotEmpty ? controller.forTraineeNomiSearch : TraineeNominationDataList;

  return listToUse.asMap().entries.map<DataGridRow>((entry)

    {
      int index= entry.key;
      TraineeNominationModel datarows= entry.value;
      List<Widget> actionWidgets = [



        InkWell(
            onTap: () async {



              await obtainMarkListController.getTraineeMarkData(courseDurationId: datarows.courseDurationId,
                  baseSchoolNameId:datarows.baseSchoolNameId, traineeId:datarows.traineeId


              ).then((_){
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => ObtainMarkListScreen(
                    schoolName: schoolName,
                    courseName: courseName,
                    trainee: "${datarows.position} ${datarows.name}(PNo/ONo ${datarows.pno})",
                  ),
                )
                );

              }
              );


            },

            child: Text('SubjectMark',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15))),
      ];
      List<Widget> actionWidgetone = [



        InkWell(
            onTap: ()async  {
              await traineeParformanceController.getParformeData(courseDurationId: datarows.courseDurationId,
                  baseSchoolNameId:datarows.baseSchoolNameId, traineeId:datarows.traineeId).then
              ((_){
                Navigator.of(Get.context!).push(MaterialPageRoute(
                  builder: (context) => PerformanceScreen(
                    schoolName: schoolName,
                    courseName: courseName,
                    trainee: "${datarows.position} ${datarows.name}(PNo/ONo ${datarows.pno})",
                  ),
                )
                );

              }
              );



            },

            child: Text('Parformane Details',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15))),
      ];
      List<Widget> actionWidgettwo = [
        InkWell(
            onTap: () async{
              await certificateValueController.getCertificateValueList(courseDurationId: datarows.courseDurationId,traineeId: datarows.traineeId).then((_) {
                Get.to(() => CertificateScreen(
                  schoolName: schoolName,
                ));
              });
            },
            child: Text('Certificate', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15))),
      ];
      Widget BioDataList() {
        return InkWell(
            onTap: ()async {
              await tbController
                  .getTraineeBioDataInDetail(traineeId: datarows.traineeId)
                  .then((_) {
                Get.to(() => TraineeBioDataScreen());
              });
            },
            child: Text(
              '${datarows.pno}',style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              overflow: TextOverflow.ellipsis,));
      }
      Widget attentList() {
        return InkWell(
            onTap: ()async {
              await traineeAttendenseController
                  .getTraineeAttendenseData(traineeId: datarows.traineeId,courseSectionId: datarows.courseSectionId,courseDurationId: datarows.courseDurationId)
                  .then((_) {
                Get.to(() => TraineeAttenDateScreen());
              });
            },
            child: Text(
              '${datarows.percentage}%',style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigo),
              overflow: TextOverflow.ellipsis,));
      }
      return DataGridRow(cells: [

        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<Widget>(columnName: 'PNO\nONO', value: BioDataList()),
        DataGridCell<String>(columnName: 'Name', value:datarows.name ),
        DataGridCell<String>(columnName: 'Rank', value:datarows.position),
        DataGridCell<Widget>(columnName: 'Duration', value: attentList()),
        DataGridCell<Widget>(columnName: 'Result', value: Row(children: actionWidgets)),
        DataGridCell<Widget>(columnName: 'Certificate\nBackpage', value: Row(children: actionWidgetone)),
        DataGridCell<Widget>(columnName: 'Certificate', value: Row(children: actionWidgettwo)),

      ]);
    }).toList(growable: false);
  }
}

