import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

// Controlls the login screen interactions
class SplashScreenController extends GetxController {
  SMIInput<bool>? _splashInput;
  Artboard? _splashArtboard;

  // When the controller get initialized
  @override
  void onInit() {
    super.onInit();

    rootBundle.load('assets/animations/splashanimation.riv').then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'Splash');
        if (controller != null) {
          artboard.addController(controller);
          _splashInput = controller.findInput('isLoaded');
        }
        _splashArtboard = artboard;
        _splashInput?.value = false;
        Future.delayed(const Duration(seconds: 3));
        _splashInput?.value = true;
      },
    );
  }
}
