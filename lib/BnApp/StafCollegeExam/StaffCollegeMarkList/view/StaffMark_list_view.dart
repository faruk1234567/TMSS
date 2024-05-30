import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart' as intl;

import '../../../CourseDurationDetailServise/Course_Duration_Detail_Controller.dart';
import '../../../QExam/QexamCourseDurationDetail/controller/Qexam_course_duration_controller.dart';
import '../StafCollegeList/controller/sCollege_list_controller.dart';
import '../controller/staff_college_marklist_controller.dart';
import '../model/staff_college_mark_list_model.dart';










class StafCollegeMarkListView extends StatelessWidget {
  StafCollegeMarkListView({super.key});

  final StaffCollegeMarkListController controller = Get.put(StaffCollegeMarkListController());
  final ScollegeListController controller12=Get.put(ScollegeListController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staff Collage Mark List",style: TextStyle(
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Name Of The Course:  ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                    Text('${controller12.SCList.value.courseName}' '_' '${controller12.SCList.value.courseTitle}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SfDataGrid(
                    source: LocalCourseGridSource(controller.sCMarkLisst),
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

    GridColumn(
      minimumWidth: 300,
      columnName: 'Pno',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: const Text(
            'Pno',
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
      minimumWidth: 400,
      columnName: 'Name',
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: const Text(' Name',
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
      columnName: 'Rank',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Rank', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 150,
      columnName: 'IndexNo',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('IndexNo', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 150,
      columnName: 'Paper-I',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Paper-I', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),
    GridColumn(
      minimumWidth: 220,
      columnName: 'Total Obtained',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Total Obtained', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
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
      columnName: 'Percentage',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Percentage', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
      ),
    ),

    GridColumn(
      minimumWidth: 150,
      columnName: 'Pass Status',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Text('Pass Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)),
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

  late List<StaffCMarkModel> LocalCourseDataList;
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
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3.0),
            child: Text(
              row.getCells()[2].value.toString(),
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3.0),
              child: Text(
                row.getCells()[3].value.toString(),
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              )
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(4.0),
            child: Text(
              row.getCells()[4].value.toString(),
              style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(4.0),
            child: Text(
              row.getCells()[5].value.toString(),
              style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(4.0),
            child: Text(
              row.getCells()[6].value.toString(),
              style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(4.0),
            child: Text(
              row.getCells()[7].value.toString(),
              style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(4.0),
            child: Text(
              row.getCells()[8].value.toString(),
              style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),






        ]
    );
  }

  @override
  List<DataGridRow> get rows => dataGridRows;



  void buildDataGridRow() {
    dataGridRows = LocalCourseDataList.asMap().entries.map<DataGridRow>((entry) {
      // List<Widget> actionWidgets = [];
      StaffCMarkModel dataRows = entry.value;




      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value:dataRows.pno ),
        DataGridCell<String>(columnName: 'AttentYear', value: dataRows.name),
        DataGridCell<String>(columnName: 'CourseName', value: dataRows.rank.toString()=="null"?" ":dataRows.rank ),
        DataGridCell<String>(columnName: 'DurationFrom', value: dataRows.indexNo ),
        DataGridCell<String>(columnName: 'Index', value:dataRows.paperI ),
        DataGridCell<String>(columnName: 'AttentYear', value: dataRows.totalObtained.toString()=="null"?" ":dataRows.totalObtained),
        DataGridCell<String>(columnName: 'CourseName', value: dataRows.totalMark ),
        DataGridCell<String>(columnName: 'DurationFrom', value: dataRows.percentage ),
        DataGridCell<String>(columnName: 'Index', value:dataRows.passStatus ),




      ]);
    }).toList(growable: false);
  }
}

