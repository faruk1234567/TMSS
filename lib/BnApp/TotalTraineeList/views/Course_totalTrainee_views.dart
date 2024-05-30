import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:intl/intl.dart' as intl;

import '../controller/Total_trainee_controller.dart';
import '../model/total_trainee_model.dart';
import 'package:syncfusion_flutter_core/theme.dart';




class TotalTraineeDataSearch extends StatefulWidget {
  TotalTraineeDataSearch({Key? key, required this.course});
  String? course;
  //String? courseTitle;

  @override
  State<TotalTraineeDataSearch> createState() => _DataSearchState();
}

class _DataSearchState extends State<TotalTraineeDataSearch> {
  final TotalTraineeController controller = Get.put(TotalTraineeController());

  /*Set<String> uniqueSchoolNames = <String>{};

  @override
  initState() {
    super.initState();
    uniqueSchoolNames =
        controller.localCourseList.map((course) => course.schoolName!).toSet();
  }*/

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) => controller.forTraineeSearch.clear(),
      child: Obx(
            () => controller.isLoading.value
            ? CircularProgressIndicator()
            : Scaffold(
          // Assuming two schools, adjust as needed

          appBar: AppBar(
            leading: IconButton(
              onPressed: (){

                controller.forTraineeSearch.clear();
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

                  child: CupertinoSearchTextField(
                    onChanged: (value) {
                      setState(() {
                        controller.searchforTrainee(value);
                      }); // Call search function in the controller
                    },
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Expanded(
                child: DataTableWidget(
                  data: controller.totalTraineeList.where(
                          (p0) => p0.course == widget.course).toList(),controller: controller,

                  // controller2.localCourseList.map((element) => DataTableWidget(data: controller2.localCourseList.where((p0) => p0.baseSchoolNameId == element.baseSchoolNameId).toList())).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List<TotalTraineeModel> data;
  final TotalTraineeController controller;

  DataTableWidget({required this.data, required this.controller});

  Widget build(BuildContext context) {
    return Scaffold(
      body: SfDataGridTheme(
        data: SfDataGridThemeData(headerColor: Colors.deepPurple,
            gridLineColor: Colors.black, gridLineStrokeWidth: 3.0
        ),
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
        minimumWidth: 100,
        columnName: 'Ser:No',
        label: Container(
          padding: const EdgeInsets.all(12),
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
        minimumWidth: 550,
        columnName: 'Name And Rank',
        label: Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.centerLeft,
          child: const Text('Name And Rank',
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
  final TotalTraineeController controller;

  late List<TotalTraineeModel> LocalCourseDataList;
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





    ]);
  }

  @override
  List<DataGridRow> get rows  {
    List<TotalTraineeModel> listToUse = controller.forTraineeSearch.isNotEmpty ? controller.forTraineeSearch : LocalCourseDataList;

    return listToUse.asMap().entries.map<DataGridRow>((entry) {
          int index = entry.key;
          TotalTraineeModel dataRows = entry.value;



          // List<Widget> actionWidgets = [];

          return DataGridRow(cells: [
            DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
            DataGridCell<String>(columnName: 'Name And Rank', value: "${dataRows.position} ${dataRows.name}(Pno-${dataRows.pno})"),

          ]);
        }).toList(growable: false);
  }
}
