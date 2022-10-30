import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/theme_utils.dart';
import '../controllers/splash_screen_controller.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  // put the splash controller
  final splashController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              width: 150,
              height: 150,
              child: splashController.obx(
                  (state) => Rive(
                        artboard: splashController.birdArtboard,
                      ),
                  onLoading: const Center(
                    child: CircularProgressIndicator(),
                  ))),
          Text(
            'MunchEase',
            style: TextStyle(
              color: MunchColors.primaryColor,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 42.0,
            ),
          )
        ]),
      ),
    );
  }
}
