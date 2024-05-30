import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navy_project/BnApp/traineeNomination/controller/trinee_nomination_controller.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';


import 'package:intl/intl.dart' as intl;

import '../controller/Get_course_country_bySchool_controller.dart';
import '../model/Get_course_country_bySchool_model.dart';



class SchoolDataSearch extends StatefulWidget {
  SchoolDataSearch({Key? key, required this.baseName});
  String? baseName;

  @override
  State<SchoolDataSearch> createState() => _DataSearchState();
}

class _DataSearchState extends State<SchoolDataSearch> {
  final GetCourseBySchool controller = Get.put(GetCourseBySchool());

  /*Set<String> uniqueSchoolNames = <String>{};

  @override
  initState() {
    super.initState();
    uniqueSchoolNames =
        controller.localCourseList.map((course) => course.schoolName!).toSet();
  }*/

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => controller.isLoading.value
          ? CircularProgressIndicator()
          : Scaffold(
        // Assuming two schools, adjust as needed

        appBar: AppBar(
          title: Text('SchoolList',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 2,
            ),
            Row(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Colors.redAccent,
              )
            ]),
            Expanded(
              child: DataTableWidget(
                data: controller.CountryCourseByList
                    .where((p0) => p0.baseName == widget.baseName)
                    .toList(),

                // controller2.localCourseList.map((element) => DataTableWidget(data: controller2.localCourseList.where((p0) => p0.baseSchoolNameId == element.baseSchoolNameId).toList())).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List<GetCourseCountryBySchool> data;

  DataTableWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: LocalCourseGridSource(data),
      columns: getColumns(),
      rowHeight: 60,
    );
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
        minimumWidth: 350,
        columnName: 'School',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('School',
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
        columnName: 'Qty Course',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text('Qty Course',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25)),
        ),
      ),
      GridColumn(
        minimumWidth: 150,
        columnName: 'Officer''s',
        label: Container(
          padding: const EdgeInsets.all(14),
          alignment: Alignment.center,
          child: const Text('Officer''s',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25)),
        ),
      ),
      GridColumn(
        minimumWidth: 150,
        columnName: 'Mids',
        label: Container(
          padding: const EdgeInsets.all(14),
          alignment: Alignment.center,
          child: const Text('Mids',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25)),
        ),
      ),
      GridColumn(
        minimumWidth: 150,
        columnName: 'Sailor''s',
        label: Container(
          padding: const EdgeInsets.all(14),
          alignment: Alignment.center,
          child: const Text('Sailor''s',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25)),
        ),
      ),
      GridColumn(
        minimumWidth: 150,
        columnName: 'Civil',
        label: Container(
          padding: const EdgeInsets.all(14),
          alignment: Alignment.center,
          child: const Text('Civil',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25)),
        ),
      ),
      GridColumn(
        minimumWidth: 150,
        columnName: 'Foreign',
        label: Container(
          padding: const EdgeInsets.all(14),
          alignment: Alignment.center,
          child: const Text('Foreign',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25)),
        ),
      ),
      GridColumn(
        minimumWidth: 150,
        columnName: 'Total',
        label: Container(
          padding: const EdgeInsets.all(14),
          alignment: Alignment.center,
          child: const Text('Total',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25)),
        ),
      ),


    ];
  }
}

class LocalCourseGridSource extends DataGridSource {
  LocalCourseGridSource(this.LocalCourseDataList) {
    buildDataGridRow();
  }

  late List<GetCourseCountryBySchool> LocalCourseDataList;
  late List<DataGridRow> dataGridRows;


  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
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
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[1].value.toString(),
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),


      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3.0),
          child: Text(
            row.getCells()[2].value.toString(),
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
            overflow: TextOverflow.ellipsis,
          )),
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3.0),
          child: Text(
            row.getCells()[3].value.toString(),
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
            overflow: TextOverflow.ellipsis,
          )),
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3.0),
          child: Text(
            row.getCells()[4].value.toString(),
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
            overflow: TextOverflow.ellipsis,
          )),
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3.0),
          child: Text(
            row.getCells()[5].value.toString(),
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
            overflow: TextOverflow.ellipsis,
          )),
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3.0),
          child: Text(
            row.getCells()[6].value.toString(),
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
            overflow: TextOverflow.ellipsis,
          )),
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3.0),
          child: Text(
            row.getCells()[7].value.toString(),
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
            overflow: TextOverflow.ellipsis,
          )),
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3.0),
          child: Text(
            row.getCells()[8].value.toString(),
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
            overflow: TextOverflow.ellipsis,
          )),
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows =
        LocalCourseDataList.asMap().entries.map<DataGridRow>((entry) {
          int index = entry.key;
          GetCourseCountryBySchool dataRows =entry.value;

         // List<Widget> actionWidgets = [];


          return DataGridRow(cells: [
            DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
            DataGridCell<String>(
                columnName: 'Base/Institute/Ship',
                value: dataRows.schoolName),
            DataGridCell<int>(
                columnName: 'Qty Course', value: dataRows.courseCount),
            DataGridCell<int>(
                columnName: 'Officer''s', value: dataRows.officerCount),
            DataGridCell<int>(
                columnName: 'Mids',
                value: dataRows.midCount),
          DataGridCell<int>(
          columnName: 'cadet',
          value: dataRows.cadetCount),
            DataGridCell<int>(
                columnName: 'Sailor''s',
                value: dataRows.saylorCount),
            DataGridCell<int>(
                columnName: 'Civil',
                value: dataRows.civilCount),
            DataGridCell<int>(
                columnName: 'Foreign',
                value: dataRows.foreignCount),
            DataGridCell<int>(
                columnName: 'Total',
                value: dataRows.traineeCount),
          ]);
        }).toList(growable: false);
  }
}
