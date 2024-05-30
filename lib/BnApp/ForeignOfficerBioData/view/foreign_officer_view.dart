import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../../CivilOfficersBiodata/model/Civil_model.dart';
import '../controller/foreign_officers_controller.dart';

class ForeignOfficerBoiPage extends StatefulWidget {
  ForeignOfficerBoiPage({super.key});

  @override
  State<ForeignOfficerBoiPage> createState() => _ForeignOfficerBoiPageState();
}

class _ForeignOfficerBoiPageState extends State<ForeignOfficerBoiPage> {
  final ForeignOfficerController controller = Get.put(ForeignOfficerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Foreign Officer's BIO Data", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo)),
        ),
        body: SfDataGridTheme(
          data: SfDataGridThemeData(headerColor: Colors.blueGrey, gridLineColor: Colors.black, gridLineStrokeWidth: 3.0),
          // headerColor: const Color(0xff009889), child: null,),
          child: Obx(
                () => Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                child: SfDataGrid(source: LocalCourseGridSource(controller.FODataDetails, controller), columns: getColumns(), gridLinesVisibility: GridLinesVisibility.both),
              ),
              //headerGridLinesVisibility: GridLinesVisibility.both),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      if (controller.pageNumber.value != 1) {
                        controller.pageNumber.value = controller.pageNumber.value - 1;
                        await controller.getForeignOfficerDetail();
                      }
                    },
                    child: const Text("Previous"),
                  ),
                  const SizedBox(width: 12),
                  Text('Page: ${controller.pageNumber.value} '),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () async {
                      controller.pageNumber.value = controller.pageNumber.value + 1;

                      await controller.getForeignOfficerDetail();
                    },
                    child: const Text("Next"),
                  ),
                ],
              ),
            ]),
          ),
        ));
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
        child: const Text('Ser:No', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25), overflow: TextOverflow.clip, softWrap: true),
      ),
    ),

    GridColumn(
      minimumWidth: 600,
      columnName: 'Rank & Name',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Rank & Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 150,
      columnName: 'Country',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('country', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
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
  LocalCourseGridSource(this.localCourseDataList, this.controller);

  final ForeignOfficerController controller;

  late List<Items> localCourseDataList;
  late List<DataGridRow> dataGridRows;

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
        padding: const EdgeInsets.all(4.0),
        child: Text(
          row.getCells()[0].value.toString(),
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
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

      /*Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(14.0),
        child: row.getCells()[4].value,
        color: Colors.green,
      ),*/
    ]);
  }

  @override
  List<DataGridRow> get rows {
    List<Items> listToUse = controller.searchList.isNotEmpty ? controller.searchList : localCourseDataList;

    return listToUse.asMap().entries.map<DataGridRow>((entry) {
      int index = entry.key;
      Items datarow = entry.value;
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'shortCode', value: '${datarow.name} (PNO ${datarow.pno}) '),
        DataGridCell<String>(columnName: 'subjectname', value: '${datarow.country.toString() == "null" ? " " : datarow.country}'),
      ]);
    }).toList(growable: false);
  }
}