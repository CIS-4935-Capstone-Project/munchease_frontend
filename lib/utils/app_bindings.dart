import 'dart:developer';
import 'package:get/get.dart';
import 'package:munchease/controllers/login_screen_controller.dart';
import 'package:munchease/controllers/onboarding_cuisine_controller.dart';
import 'package:munchease/controllers/onboarding_diet_controller.dart';
import 'package:munchease/controllers/splash_screen_controller.dart';

// Global binding for the app
class AppBinding implements Bindings {
  @override
  void dependencies() {
    log('Loading Controllers', name: '${this.runtimeType}');
    Get.put(LoginScreenController());
    Get.put(SplashScreenController());
    Get.put(OnboardingCuisineController());
    Get.put(OnboardingDietController());
  }
}
