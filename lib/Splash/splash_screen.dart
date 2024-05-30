import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navy_project/BnApp/LoginService/login_controller.dart';

import '../BnApp/DashBoardTamplate/DashBoard_Screen.dart';
import '../BnApp/LoginService/login_Screen.dart';
import '../api/storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateTo();
  }

  navigateTo() async {
    await Future.delayed(const Duration(seconds: 2)).then((_) {
      print(storage.read('token'));
      print(storage.read('role'));
      if (storage.read('token') != null) {
        checkRole(storage.read('role'));
      } else {
        Get.off(() => LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'images/logo.png',
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ),
            SizedBox(height: 20),
            const Text(
              "TMS",
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
