import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:navy_project/BnApp/DashBoardTamplate/DashBoard_Screen.dart';
import 'package:provider/provider.dart';

import '../../api/Bn_AppRoutes.dart';
import '../DashBoardTamplate/Bna_dashboard-Screen.dart';
import '../DashBoardTamplate/SchoolDashBoard_Screen.dart';
import '../DashBoardTamplate/bn_data_schools_screen.dart';
import 'login_repository.dart';

class LoginController extends GetxController {
  final GetStorage storage = GetStorage();

  /* @override
  void onInit() {
    rememberMe.value = storage.read('rememberMe') ?? false;
    super.onInit();
  }*/

  /* var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;*/
  var emailController = ''.obs;
  var passwordController = ''.obs;
  var isLoading = false.obs;
  // var isChecked = false.obs ;
  var isVisible = true.obs;
  void visibilityToggle() {
    isVisible.value = !isVisible.value;
    update();
  }

  loginWithEmail() async {
    isLoading.value = true;
    // isChecked.value=true;

    var response = await LoginRepo().login(emailController.value, passwordController.value);

    storage.write('token', response.token);

    storage.write('role', response.role);
    storage.write('branchId', response.branchId);

    print('>>>>>>>>>role>>>${storage.read('role')}');
    checkRole(storage.read('role'));

    emailController.value = '';
    passwordController.value = '';
    Get.snackbar('success', 'Login successfully ');
    if (storage.read("isChecked") == false) {
      storage.write('userName', null);
      storage.write('password', null);
    }

    isLoading.value = false;

    // isChecked.value=false;
  }

  /*@override
  void onClose() {
    emailController.close();
    passwordController.close();
    super.onClose();
  }*/
}

checkRole(String role) {
  switch (role) {
    case 'Master Admin':
      Get.off(() => HomeScreen());
      break;
    case 'Super Admin':
      Get.to(() => SchoolDashBoardScreen());
      break;
    case 'BNA School':
      Get.to(() => BnaDashBoardScreen());
      break;
    default:
      Get.off(() => HomeScreen());
  }
}
