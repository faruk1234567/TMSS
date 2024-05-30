import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:navy_project/BnApp/traineeNomination/TraineeAttendenseList/TAttendenseViews/trainee_attendens_detail_data.dart';

import '../TAttendenseController/trainee_attendense_controller.dart';
import 'package:intl/intl.dart' as intl;








class TraineeAttenDateScreen extends StatefulWidget {
  const TraineeAttenDateScreen({super.key});

  @override
  State<TraineeAttenDateScreen> createState() => _BnDataSchoolsScreenState();
}

class _BnDataSchoolsScreenState extends State<TraineeAttenDateScreen> {
  final TraineeAttendenseController controller = Get.put(TraineeAttendenseController());

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ExamModuleList"),
      ),
      body: Obx(() => controller.isLoading.value
          ? SpinKitCircle(
        color: Colors.blue.shade900,
      )
          : Column(
        children: [
          /* SizedBox(
            height: 60,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 100),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),*/
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: controller.uniqueDate.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => TraineeAttendenseDataSearch(
                        date: controller.uniqueDate

                            .elementAt(index)));
                  },
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue.shade900,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.white54,
                            blurRadius: 2,
                            offset: Offset(0, 2)),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 12,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaler: const TextScaler.linear(1),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .65,
                          child: Text(
                              intl.DateFormat.yMMMd().format( controller.uniqueDate
                                .elementAt(index)),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis),
                            textScaler: const TextScaler.linear(1),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
