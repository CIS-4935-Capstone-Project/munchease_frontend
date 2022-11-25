import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/home_screen_controller.dart';
import 'package:munchease/controllers/splash_screen_controller.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(HomeScreenController());
  SplashScreenController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hamburger Icon
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                height: 4,
                                width: 30,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 226, 176, 140),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                            ),
                            Container(
                              height: 2,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Colors.yellow[600]!,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                              ),
                            ),
                            Container(
                              height: 5,
                              width: 37,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 68, 68),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                height: 4,
                                width: 30,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 226, 176, 140),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () => {null},
                onTapCancel: () => {null},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    // logo
                    width: 100,
                    height: 100,
                    child: Hero(
                      tag: 'logo',
                      child: Rive(
                        artboard: splashController.birdArtboard,
                      ),
                    ),
                  ),
                ],
              ),
              controller.obx(
                (state) => const SizedBox(
                  height: 60,
                  width: 60,
                  child: Text('Hello'),
                ),
                onLoading: const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
