import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../controller/other_officer_controller.dart';
import '../model/others_officesr_model.dart';












class OthersOfficerBoiPage extends StatefulWidget {
  OthersOfficerBoiPage({super.key});

  @override
  State<OthersOfficerBoiPage> createState() => _OthersOfficerBoiPageState();
}

class _OthersOfficerBoiPageState extends State<OthersOfficerBoiPage> {
  final OtherOfficerController controller = Get.put(OtherOfficerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Officer BIO Data",style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.indigo)),
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
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: SfDataGrid(
                        source: LocalCourseGridSource(controller.OtherOfficerDataDetails,controller),
                        columns: getColumns(),
                        gridLinesVisibility: GridLinesVisibility.both),
                  ),
                  //headerGridLinesVisibility: GridLinesVisibility.both),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          if (controller.pageNumber.value != 1) {
                            controller.pageNumber.value = controller.pageNumber.value - 1;
                            await controller.getOthersOfficerDetail();
                          }
                        },
                        child: Text("Previous"),
                      ),
                      SizedBox(width: 12),
                      Text('Page: ${controller.pageNumber.value} '),
                      SizedBox(width: 12),
                      OutlinedButton(
                        onPressed: () async {
                          controller.pageNumber.value = controller.pageNumber.value + 1;

                          await controller.getOthersOfficerDetail();
                        },
                        child: Text("Next"),
                      ),

                    ],
                  ),
                ]
            ),
          ),
        )
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
      minimumWidth: 550,
      columnName: 'Rank & Name',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Rank & Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 250,
      columnName: 'BNA No',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('BNA No', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 200,
      columnName: 'Batch',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Batch', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 250,
      columnName: 'Joining Date',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Joining Date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
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
  LocalCourseGridSource(this.LocalCourseDataList,this.controller);
  final OtherOfficerController controller;

  late List<Items> LocalCourseDataList;
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
              style: TextStyle( fontSize: 23, fontWeight: FontWeight.bold,color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10.0),
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
              intl.DateFormat.yMMMd().format( row.getCells()[4].value),
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
  List<DataGridRow> get rows {
    List<Items> listToUse = controller.searchList.isNotEmpty ? controller.searchList : LocalCourseDataList;
    return listToUse.asMap().entries.map<DataGridRow>((entry)  {
      int index= entry.key;
      Items datarows=entry.value;
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'shortCode', value: '${datarows.name} (PNO ${datarows.pno}) '),
        DataGridCell<String>(columnName: 'subjectname', value: '${datarows.bnaNo.toString()=="null"?" ":datarows.bnaNo}' ),
        DataGridCell<String>(columnName: 'shortCode', value: '${datarows.bnaBatch}  '),
        DataGridCell<DateTime>(columnName: 'shortCode', value: datarows.joiningDate),


      ]);
    }).toList(growable: false);
  }
}

