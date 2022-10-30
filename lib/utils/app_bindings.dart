import 'dart:developer';
import 'package:get/get.dart';
import 'package:munchease/controllers/login_screen_controller.dart';
import 'package:munchease/controllers/splash_screen_controller.dart';
import '../controllers/register_screen_controller.dart';

// Global binding for the app
class AppBinding implements Bindings {
  @override
  void dependencies() {
    log('Loading Controllers', name: '${this.runtimeType}');
    Get.put(SplashScreenController());
    Get.put(RegisterScreenController());
    Get.put(LoginScreenController());
  }
}
