import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/home_screen_controller.dart';
import 'package:munchease/controllers/splash_screen_controller.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:munchease/widgets/me_drawer.dart';
import 'package:munchease/widgets/me_text_button.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatelessWidget with CuisineBox, DietBox {
  HomeScreen({super.key});
  final controller = Get.put(HomeScreenController());
  SplashScreenController splashController = Get.find();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: buildIcon()),
        centerTitle: true,
        title: SizedBox(
          // logo
          width: 51,
          height: 51,
          child: Hero(
            tag: 'logo',
            child: Rive(
              artboard: splashController.birdArtboard,
            ),
          ),
        ),
      ),
      key: _key,
      drawer: const MunchDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controller.obx(
                  (state) => (MunchButton(
                      buttonType: MunchButtonType.filled,
                      onPressed: () => Get.toNamed('/register'),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ))),
                  onLoading: const CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildIcon() {
    return InkWell(
      child: SizedBox(
        height: 50,
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 4,
                width: 30,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 176, 140),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            Container(
              height: 5,
              width: 37,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 68, 68),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 4,
                width: 30,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 176, 140),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        _key.currentState!.openDrawer();
      },
      onTapCancel: () => {},
    );
  }
}
