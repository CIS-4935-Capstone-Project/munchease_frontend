import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/onboarding_cuisine_controller.dart';
import 'package:munchease/widgets/global_widgets.dart';
import 'package:munchease/widgets/me_drawer.dart';
import 'package:munchease/widgets/me_filterchip.dart';

import '../utils/app_pages.dart';
import '../widgets/me_text_button.dart';

class OnboardingCuisineScreen extends GetView<OnboardingCuisineController> {
  const OnboardingCuisineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MunchDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      appBar: buildTitleAppBar('Cuisine'),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'choose what cuisine you have preferences for',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Expanded(
                  child: Scrollbar(
                    radius: const Radius.circular(10),
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      primary: true,
                      child: Column(children: [
                        Obx(
                          () => Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            alignment: WrapAlignment.start,
                            children: controller.availableCuisines
                                .map((cuisine) => MunchChip(
                                    selected: controller.selectedCuisines
                                        .contains(cuisine),
                                    label: cuisine,
                                    onSelected: (isSelected) {
                                      controller.handleMunchchip(
                                          cuisine: cuisine,
                                          isSelected: isSelected);
                                    }))
                                .toList(),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.center,
                    child: MunchButton(
                        buttonType: MunchButtonType.filled,
                        child: const Text("Next"),
                        onPressed: () {
                          Get.toNamed(Routes.DIET);
                        })),
                const SizedBox(height: 10)
              ],
            )),
      ),
    );
  }
}
