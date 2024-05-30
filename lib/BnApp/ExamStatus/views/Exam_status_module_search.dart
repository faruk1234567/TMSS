import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../controller/Exam_status_controller.dart';
import 'Exam_status_data_search.dart';






class ExamStatusModuleScreen extends StatefulWidget {
  const ExamStatusModuleScreen({super.key});

  @override
  State<ExamStatusModuleScreen> createState() => _BnDataSchoolsScreenState();
}

class _BnDataSchoolsScreenState extends State<ExamStatusModuleScreen> {
  final ExamStatusListController controller = Get.put(ExamStatusListController());

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
              itemCount: controller.uniqueSchoolNames.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => ExamStatusDataSearch(
                        moduleName: controller.uniqueSchoolNames
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
                            controller.uniqueSchoolNames
                                .elementAt(index).toString(),
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
