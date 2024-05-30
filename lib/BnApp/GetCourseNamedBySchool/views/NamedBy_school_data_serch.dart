import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:intl/intl.dart' as intl;

import '../../CoursesSubjectList/controller/Course_subject_list_controller.dart';
import '../../CoursesSubjectList/views/CourseSubjectList.dart';
import '../../GetCourseNameDetail/contrller/get_course_named_detail.controller.dart';
import '../controller/get_named_by_school_controller.dart';
import '../model/get_course_named_by_school_model.dart';

class NamedSchoolDataSearch extends StatefulWidget {
  NamedSchoolDataSearch({Key? key, required this.schoolname});
  String? schoolname;

  @override
  State<NamedSchoolDataSearch> createState() => _DataSearchState();
}

class _DataSearchState extends State<NamedSchoolDataSearch> {
  final GetCoursenamedBySchool controller = Get.put(GetCoursenamedBySchool());

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
                title: Text('Courses List',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo)),
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
                      data: controller.NamedCourseByList.where(
                          (p0) => p0.schoolname == widget.schoolname).toList(),

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
  final List<GetCourseNamedBySchool> data;

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
        minimumWidth: 450,
        columnName: 'CourseNme',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('CourseNme',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
         GridColumn(
        minimumWidth: 150,
        columnName: 'Actions',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Actions',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true

          ),
        ),
      )
    ];
  }
}

class LocalCourseGridSource extends DataGridSource {
  LocalCourseGridSource(this.LocalCourseDataList) {
    buildDataGridRow();
  }

  late List<GetCourseNamedBySchool> LocalCourseDataList;
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
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          overflow: TextOverflow.ellipsis,
        ),
      ),
       Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(14.0),
        child: row.getCells()[2].value,
        //color: Colors.indigo,
      ),
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;
  CourseSubjectListController courseSubjectListController= Get.put(CourseSubjectListController());
   GetCourseNamedDetailController getCourseNamedDetailController =Get.put(GetCourseNamedDetailController());

  void buildDataGridRow() {
    dataGridRows =
        LocalCourseDataList.asMap().entries.map<DataGridRow>((entry) {
      int index = entry.key;
      GetCourseNamedBySchool dataRows = entry.value;

      List<Widget> actionWidgets = [



            InkWell(
                onTap: () async {
                  await getCourseNamedDetailController.getcourseNamedForSDetail(courseNameId: dataRows.courseNameId);
                  await courseSubjectListController.getSubjectListData(baseschoolnameid:dataRows.baseschoolnameid,
                      courseNameId:dataRows.courseNameId).then
                    ((_){
                    Navigator.of(Get.context!).push(MaterialPageRoute(
                      builder: (context) => CourseSubjectList(),
                    )
                    );

                  }
                  );

                },


                  child:  Text('Syllabus', style: TextStyle(
                  fontWeight:  FontWeight.bold,fontSize: 20,color: Colors.deepPurple))),
          ];

      // List<Widget> actionWidgets = [];

      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
        DataGridCell<String>(columnName: 'CourseNme', value: dataRows.course),
         DataGridCell<Widget>(columnName: 'Action', value: Row(children: actionWidgets)),
      ]);
    }).toList(growable: false);
  }
}
