import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navy_project/BnApp/traineeNomination/controller/trinee_nomination_controller.dart';

class TraineeNominationScreen extends StatelessWidget {
  TraineeNominationScreen({super.key, required this.schoolName});

  String? schoolName;
  // String? traine;
  // String? cousrse;

  final TraineeNominationController controller = Get.put(TraineeNominationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trainee Nomination"), //title of app
        backgroundColor: Colors.redAccent, //background color of app bar
      ),
      body: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('School:  ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.red)),
                Text(schoolName!,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.red)),
              ],
            ),
            Row(
              children: [
                Text('Course :'),
                Text(controller.traineeNominationList[0].course! + controller.traineeNominationList[0].courseTitle!),
              ],
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(28),
                  child: ListView.builder(
                      itemCount: controller.traineeNominationList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Table(
                          defaultColumnWidth: FixedColumnWidth(160.0),
                          border: TableBorder.all(width: 2, color: Colors.black45), //table border
                          children: [
                            /* TableRow(children: [
                            Column(children:[ Text("S/N")]),
                            Column(children:[ Text("S/N")]),
                            Column(children:[ Text("S/N")]),
                            Column(children:[ Text("S/N")]),
                          ]),*/
                            TableRow(children: [
                              Column(children: [
                                Text(controller.traineeNominationList[index].name!),
                              ]),
                              Column(children: [
                                InkWell(
                                    onTap: () {
                                      // somethingPage(schoolName: schoolName, course:controller.traineeNominationList[index].course, trainee: controller.traineeNominationList[index].name );
                                    },
                                    child: Text(controller.traineeNominationList[index].name!)),
                              ]),
                              Column(children: [Text(controller.traineeNominationList[index].courseSectionId!.toString())]),
                              Column(children: [Text(controller.traineeNominationList[index].courseTitle!.toString())]),
                            ]),
                          ],
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
