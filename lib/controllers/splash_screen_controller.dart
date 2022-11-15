import 'package:get/get.dart';
import 'package:munchease/screens/register_screen.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

// Controlls the login screen interactions
enum SplashScreenStates { none, loading, success, error, empty }

class SplashScreenController extends GetxController
    with StateMixin<SplashScreenStates> {
  RxDouble textOpacity = 1.0.obs;
  late Artboard birdArtboard;
  SMIInput<bool>? trigger;
  StateMachineController? stateMachineController;
  @override
  void onInit() {
    super.onInit();
    change(SplashScreenStates.loading, status: RxStatus.loading());
    rootBundle.load('assets/animations/splashanimation.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        stateMachineController =
            StateMachineController.fromArtboard(artboard, "Splash");
        if (stateMachineController != null) {
          artboard.addController(stateMachineController!);
          trigger = stateMachineController!.findInput('isLoaded');
        }
        birdArtboard = artboard;
        change(SplashScreenStates.success, status: RxStatus.success());
        await Future.delayed(const Duration(milliseconds: 1750)).then((value) {
          trigger?.value = true;
          textOpacity.value = 0.0;
        });
        Future.delayed(const Duration(milliseconds: 2000))
            .then((value) => Get.toNamed('/register'));
      },
    );
  }
}
