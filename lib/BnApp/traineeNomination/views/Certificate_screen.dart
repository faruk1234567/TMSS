import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;

import '../TraineeCerificate/controller/trainee_certificate_controller.dart';

class CertificateScreen extends StatefulWidget {
   CertificateScreen({super.key,required this.schoolName});
  String? schoolName;

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> implements WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  final CertificateValueController controller = Get.put(CertificateValueController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.print,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Print",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width * .90,
                height: 450,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/Certificate-border.png"), fit: BoxFit.contain),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'images/logo.png',
                        height: 100,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Banladesh Navy".toUpperCase(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Ser No........",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          Text(
                              '${widget.schoolName}'.toUpperCase(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Text(
                            "This Certificate has been awarded to",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 20),
                           Row(
                            children: [
                              Text('P/ONO '),
                              SizedBox(width: 10,),
                              Text('${controller.CertificateListValue[0].pno}'),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Name'),
                              SizedBox(width: 10,),
                              Text('${controller.CertificateListValue[0].name}'),
                              SizedBox(width: 10,),
                              Text('Rank'),
                              Text('..................................'),
                            ],
                          ),
                          const SizedBox(height: 12),
                           Row(
                            children: [
                              Text('who has qualified'),
                              SizedBox(width: 8),
                              Text('${controller.CertificateListValue[0].course}'),
                              SizedBox(width: 8),
                              Text('of'),
                              SizedBox(width:4),
                              Text('${controller.CertificateListValue[0].weeks}'),
                              SizedBox(width: 8),
                              Text('weeks'),
                            ],
                          ),
                          const SizedBox(height: 12),
                           Row(
                            children: [
                              Text('duration held at this institution'),
                              Text(DateFormat('dd MMMM yyyy', 'en_US').format(controller.CertificateListValue[0].durationFrom!)),
                              Text('to'),
                              Text(DateFormat('dd MMMM yyyy', 'en_US').format(controller.CertificateListValue[0].durationTo!)),
                            ],),


                           SizedBox(height: 12),
                           Row(
                            children: [
                              Text('and obtained'),
                              Text('${controller.CertificateListValue[0].obtained}'),
                              Text('% marks securing'),
                              Text('${controller.CertificateListValue[0].position}'),
                              Text('/'),
                              Text('${controller.CertificateListValue[0].totalTrainee}'),
                              Text('position'),
                            ],
                          ),
                          const SizedBox(height: 50),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Training Commander'),
                              Text('Commanding Officer'),
                            ],
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeAccessibilityFeatures() {
    // TODO: implement didChangeAccessibilityFeatures
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    // TODO: implement didChangeLocales
  }

  @override
  void didChangeMetrics() {
    // TODO: implement didChangeMetrics
  }

  @override
  void didChangePlatformBrightness() {
    // TODO: implement didChangePlatformBrightness
  }

  @override
  void didChangeTextScaleFactor() {
    // TODO: implement didChangeTextScaleFactor
  }

  @override
  void didHaveMemoryPressure() {
    // TODO: implement didHaveMemoryPressure
  }

  @override
  Future<bool> didPopRoute() {
    // TODO: implement didPopRoute
    throw UnimplementedError();
  }

  @override
  Future<bool> didPushRoute(String route) {
    // TODO: implement didPushRoute
    throw UnimplementedError();
  }

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    // TODO: implement didPushRouteInformation
    throw UnimplementedError();
  }

  @override
  Future<AppExitResponse> didRequestAppExit() {
    // TODO: implement didRequestAppExit
    throw UnimplementedError();
  }
}