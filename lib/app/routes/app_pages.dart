import 'package:get/get.dart';

import 'package:food/app/modules/defaulthome/bindings/defaulthome_binding.dart';
import 'package:food/app/modules/defaulthome/views/defaulthome_view.dart';
import 'package:food/app/modules/home/bindings/home_binding.dart';
import 'package:food/app/modules/home/views/home_view.dart';
import 'package:food/app/modules/signup/bindings/signup_binding.dart';
import 'package:food/app/modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNUP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.DEFAULTHOME,
      page: () => DefaulthomeView(),
      binding: DefaulthomeBinding(),
    ),
  ];
}
