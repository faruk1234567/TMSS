import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../controller/Get_course_country_bySchool_controller.dart';
import 'Get_School_data_search_school.dart';

class GetCountryBySchool extends StatefulWidget {
  const GetCountryBySchool({super.key});

  @override
  State<GetCountryBySchool> createState() => _BnDataSchoolsScreenState();
}

class _BnDataSchoolsScreenState extends State<GetCountryBySchool> {
  final GetCourseBySchool controller = Get.put(GetCourseBySchool());
  late String  _searchQuery = '';

  @override
  initState() {
    super.initState();
  }
  Iterable<String> getFilteredSchools(String searchQuery) {
    final RxSet<String> allSchools = controller.uniqueCountrySchoolNames;
    if (searchQuery.isEmpty) {
      return allSchools;
    } else {
      return allSchools
          .where((school) =>
          school.toLowerCase().startsWith(searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Base/Institute/Ship",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red)),
      ),
      body: Column(children: [
        SizedBox(
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoSearchTextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });

                  }
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),

      Expanded(child:Obx(() => controller.isLoading.value
          ? SpinKitCircle(
              color: Colors.blue.shade900,
            )
          : Column(
              children: [
                /*SizedBox(
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
                    itemCount: getFilteredSchools(_searchQuery).length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => SchoolDataSearch(
                              baseName: getFilteredSchools(_searchQuery)
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
                                  getFilteredSchools(_searchQuery)
                                      .elementAt(index),
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
    ),
      ]
    )
    );



  }
}
