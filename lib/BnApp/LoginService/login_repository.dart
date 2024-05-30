
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:navy_project/BnApp/LoginService/login_controller.dart';

import '../../api/Bn_Urls.dart';
import '../../api/base_client.dart';
import 'login_model.dart';
class LoginRepo {

  Future<LoginModel> login(String email, String password) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,

    };
    try {
      dio.Response response = await BaseClient.post(
        url: Urls.login,
        payload: data,

      );
      if (response.statusCode == 200) {
        LoginModel loginmodel = LoginModel.fromJson(response.data);
        return loginmodel;
      }
      else {
        Get.find<LoginController>().isLoading.value = false;
        Get.snackbar('Fail', 'Login UnSuccessful ! Invalid Password');
        // print(response.statusCode);
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}