import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/theme_utils.dart';
import '../controllers/splash_screen_controller.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  // find the splash controller
  final splashController = Get.find<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MunchColors.primaryDark,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              width: 150,
              height: 150,
              child: Rive(
                artboard: _splashArtboard!,
                fit: BoxFit.fitHeight,
              )),
          Image.asset('assets/images/logo_text.png')
        ]),
      ),
    );
  }
}
