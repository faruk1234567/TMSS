import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:intl/intl.dart' as intl;

import '../controller/Total_trainee_controller.dart';
import '../model/School_total_trainee_model.dart';
import 'package:syncfusion_flutter_core/theme.dart';





class SchoolTotalTraineeDataSearch extends StatefulWidget {
  SchoolTotalTraineeDataSearch({Key? key, required this.course});
  String? course;
  //String? courseTitle;

  @override
  State<SchoolTotalTraineeDataSearch> createState() => _DataSearchState();
}

class _DataSearchState extends State<SchoolTotalTraineeDataSearch> {
  final SchoolTotalTraineeController controller = Get.put(SchoolTotalTraineeController());

  /*Set<String> uniqueSchoolNames = <String>{};

  @override
  initState() {
    super.initState();
    uniqueSchoolNames =
        controller.localCourseList.map((course) => course.schoolName!).toSet();
  }*/

  @override
  Widget build(BuildContext context) {
    return  PopScope(
      onPopInvoked: (_) => controller.SchtraineeSearch.clear(),
      child: Scaffold(
        // Assuming two schools, adjust as needed

        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              controller.SchtraineeSearch.clear();
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Trainee List',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo)),



        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,


            ),

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
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                color: Colors.white10,
                height: 50,

                child: CupertinoSearchTextField(
                  onChanged: (value) {
                    setState(() {
                      controller.forStraineesearch(value);
                    }); // Call search function in the controller
                  },
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: DataTableWidget(
                data: controller.SchoolDataList.where(
                        (p0) => p0.course!+p0.courseTitle! == widget.course).toList(),controller: controller,

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
  final List<SchoolTTraineeModel> data;
  final SchoolTotalTraineeController controller;

  DataTableWidget({required this.data, required this.controller});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SfDataGridTheme(
        data: SfDataGridThemeData(
            headerColor: Colors.deepPurple,
            gridLineColor: Colors.black,
            gridLineStrokeWidth: 5.0),
        child: SfDataGrid(
          source: LocalCourseGridSource(data,controller),
          columns: getColumns(),
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          columnWidthMode: ColumnWidthMode.fill,
          rowHeight: 50,
        ),
      ),
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
          child: const Text(
              'Ser:No',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true
          ),
        ),
      ),
      GridColumn(
        minimumWidth: 200,
        columnName: 'O.No/P.No',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('O.No/P.No',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
      GridColumn(
        minimumWidth: 350,
        columnName: 'Name',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Name',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
      GridColumn(
        minimumWidth: 180,
        columnName: 'Rank',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Rank',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),




    ];
  }
}

class LocalCourseGridSource extends DataGridSource {
  LocalCourseGridSource(this.LocalCourseDataList, this.controller) ;
  final SchoolTotalTraineeController controller;

  late List<SchoolTTraineeModel> LocalCourseDataList;
  late List<DataGridRow> dataGridRows;
  //final CourseSubjectListController getCoursenamedBySchool = Get.put(CourseSubjectListController());

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
          style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10.0),
        child: Text(
          row.getCells()[1].value.toString(),
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10.0),
        child: Text(
          row.getCells()[2].value.toString(),
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10.0),
        child: Text(
          row.getCells()[3].value.toString(),
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),





    ]);
  }

  @override
  List<DataGridRow> get rows  {
    List<SchoolTTraineeModel> listToUse = controller.SchtraineeSearch.isNotEmpty ? controller.SchtraineeSearch : LocalCourseDataList;

    return listToUse.asMap().entries.map<DataGridRow>((entry) {
          int index = entry.key;
          SchoolTTraineeModel dataRows = entry.value;



          // List<Widget> actionWidgets = [];

          return DataGridRow(cells: [
            DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
            DataGridCell<String>(columnName: 'O.No/P.No', value: "${dataRows.pno}"),
            DataGridCell<String>(columnName: 'Name', value: "${dataRows.name}"),
            DataGridCell<String>(columnName: 'Rank', value: "${dataRows.position}"),

          ]);
        }).toList(growable: false);
  }
}