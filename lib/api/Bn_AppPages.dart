import 'package:get/get.dart';

import '../BnApp/DashBoardTamplate/DashBoard_Screen.dart';
import '../BnApp/LoginService/login_Screen.dart';

import '../Splash/splash_screen.dart';
import 'Bn_AppRoutes.dart';

class AppPages {
  static const initialRoutes = AppRoutes.splash;
  static final routes = [
    GetPage(
      name: initialRoutes,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      // binding: ModuleFeatureBindings(),
    ),
  ];
}
