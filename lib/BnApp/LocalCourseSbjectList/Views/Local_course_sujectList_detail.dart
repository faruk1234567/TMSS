import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:intl/intl.dart' as intl;
import 'package:syncfusion_flutter_core/theme.dart';

import '../../CoursesSubjectList/SubjectMarklist/controller/SubjectMarkList_controller.dart';
import '../../CoursesSubjectList/SubjectMarklist/view/SubjectMarkList_view.dart';
import '../../CoursesSubjectList/controller/Course_subject_list_controller.dart';
import '../../CoursesSubjectList/views/CourseSubjectList.dart';
import '../../InstructorList/controller/instructor_list_controller.dart';
import '../../InstructorList/views/Instructor_list.dart';
import '../../RunningOfficerInformation/view/Officer_Course_list.dart';
import '../controller/local_course_subject_list_controller.dart';
import '../model/local_course_subject_list_model.dart';


class LocalSubjectDataSearch extends StatefulWidget {
  LocalSubjectDataSearch({Key? key, required this.courseModule});
  String? courseModule;

  @override
  State<LocalSubjectDataSearch> createState() => _DataSearchState();
}

class _DataSearchState extends State<LocalSubjectDataSearch> {
  final LocalCourseSubjectListController controller = Get.put(LocalCourseSubjectListController());
  final InstructorController instructorController=Get.put(InstructorController());
 // final InstructorController instructorController=Get.put(InstructorController());

  void GoInstructorIndetail() {
    Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => InstructorPage()));
  }

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
          title: Text('Course Subject List',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),



        ),
        body: Column(

          children: [
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SchoolName',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                      SizedBox(
                        width: 8,
                      ),
                      Text('${controller.CourseInfowithModelList[0].schoolName}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo)),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Name Of The Course',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                      SizedBox(
                        width: 8,
                      ),
                      Text('${controller.CourseInfowithModelList[0].course}-${controller.CourseInfowithModelList[0].courseTitle}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo)),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Course Commence:-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                      SizedBox(
                        width: 8,
                      ),
                      Text('${intl.DateFormat.yMMMd().format(controller.CourseInfowithModelList[0].durationFrom!)}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo)),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Course Complete : -',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                      SizedBox(
                        width: 8,
                      ),
                      Text('${intl.DateFormat.yMMMd().format(controller.CourseInfowithModelList[0].durationTo!)}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo)),
                    ],
                  ),
                ),
                                  //  Text('Name Of The Course'),
                                  //  Text('${controller.CourseInfowithModelList[0].course}-${controller.CourseInfowithModelList[0].courseTitle}'),
                                   // Text('ShoolName'),
                                   // Text('${controller.CourseInfowithModelList[0].durationFrom}'),
                                   // Text('ShoolName'),
                                    //Text('${controller.CourseInfowithModelList[0].durationTo}')
              ],
            ),


            InkWell(
                onTap: () async {

                  GoInstructorIndetail();




                },







                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          'Instructor List', style: TextStyle(
                          fontWeight:  FontWeight.bold,fontSize: 20,color: Colors.red)


                      ),
                    ),

                  ),




            SizedBox(
              height: 20,
            ),
            Row(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Colors.redAccent,
              )
            ]),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                color: Colors.white10,
                height: 60,

                child: CupertinoSearchTextField(
                  onChanged: (value) {
                    setState(() {
                      controller.searchSubjectMarkList(value);
                    }); // Call search function in the controller
                  },
                ),
              ),
            ),
            SizedBox(height: 25,),
            Expanded(
              child: DataTableWidget(
                data: controller.lCSList.where(
                        (p0) => p0.courseModule == widget.courseModule).toList(),controller:controller

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
  final List<LocalCourseSubListModel> data;
  final LocalCourseSubjectListController controller;

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
          rowHeight: 60,
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
                  color: Colors.black,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true
          ),
        ),
      ),
      GridColumn(
        minimumWidth: 350,
        columnName: 'SubjectName',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('SubjectName',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
      GridColumn(
        minimumWidth: 200,
        columnName: 'SubjectType',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('SubjectType',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
      GridColumn(
        minimumWidth: 250,
        columnName: 'Total Perioud',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Total Perioud',
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
        columnName: 'Total Mark',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Total Mark',
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
        columnName: 'Pass Mark',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Pass Mark',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
              overflow: TextOverflow.clip,
              softWrap: true),
        ),
      ),
      GridColumn(
        minimumWidth: 250,
        columnName: 'Actions',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text('Actions',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
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
  LocalCourseGridSource(this.LocalCourseDataList,this.controller);
  final LocalCourseSubjectListController controller;


  late List<LocalCourseSubListModel> LocalCourseDataList;
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
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[1].value.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[2].value==SubjectType.MAJOR?'MAJOR':'Minor',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[3].value.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[4].value.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(2.0),
        child: Text(
          row.getCells()[5].value.toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(14.0),
        child: row.getCells()[6].value,
        //color: Colors.indigo,
      ),
    ]);
  }

  @override
  List<DataGridRow> get rows {
  SubjectMarkListController subjectMarkListController = Get.put(SubjectMarkListController());
 // CourseSubjectListController courseSubjectListController= Get.put(CourseSubjectListController());


  List<LocalCourseSubListModel> listToUse = controller.serachListSubject.isNotEmpty ? controller.serachListSubject : LocalCourseDataList;

  return listToUse.asMap().entries.map<DataGridRow>((entry) {
          int index = entry.key;
          LocalCourseSubListModel dataRows = entry.value;

          List<Widget> actionWidgets = [



            InkWell(
                onTap: () async{
                  await subjectMarkListController.getSubjectMarkListData(baseSchoolNameId:dataRows.baseSchoolNameId,courseNameId:dataRows.courseNameId,bnaSubjectNameId:dataRows.bnaSubjectNameId).then((_) {
                    Navigator.of(Get.context!).push(MaterialPageRoute(
                      builder: (context) => MarkDataList(),
                    )
                    );

                  }
                  );

                },


                child:  Text('SubjectMarkList', style: TextStyle(
                    fontWeight:  FontWeight.bold,fontSize: 20,color: Colors.red))),
          ];

          // List<Widget> actionWidgets = [];

          return DataGridRow(cells: [
            DataGridCell<String>(columnName: 'Index', value: "${index + 1}"),
            DataGridCell<String>(columnName: 'CourseNme', value: dataRows.subjectName),
            DataGridCell<dynamic>(columnName: 'CourseNme', value: dataRows.subjectType),
            DataGridCell<String>(columnName: 'CourseNme', value: dataRows.totalPeriod),
            DataGridCell<String>(columnName: 'CourseNme', value: dataRows.totalMark),
            DataGridCell<String>(columnName: 'CourseNme', value: dataRows.passMarkBna),
            DataGridCell<Widget>(columnName: 'Action', value: Row(children: actionWidgets)),
          ]);
        }).toList(growable: false);
  }
}
