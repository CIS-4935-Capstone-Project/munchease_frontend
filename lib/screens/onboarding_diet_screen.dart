import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/onboarding_diet_controller.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:munchease/widgets/me_filterchip.dart';
import 'package:munchease/widgets/me_text_button.dart';

import '../utils/app_pages.dart';

class OnboardingDietScreen extends GetView<OnboardingDietController> {
  const OnboardingDietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Diets',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w700,
            fontSize: 36.0,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'choose if you have a dietary restriction',
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
                          Obx(() => Wrap(
                              children: controller.diets
                                  .asMap()
                                  .entries
                                  .map((entry) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 5),
                                        child: MunchChip(
                                            onSelected: (_) {
                                              controller.changeIndex(entry.key);
                                            },
                                            label: entry.value,
                                            selected: entry.key ==
                                                controller.selectedIndex),
                                      ))
                                  .toList()))
                        ])))),
            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                        child: MunchButton(
                            buttonType: MunchButtonType.line,
                            child: const Text("Previous"),
                            onPressed: () {
                              Get.toNamed(Routes.CUISINE);
                            })),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: MunchButton(
                            buttonType: MunchButtonType.filled,
                            child: const Text("Finish"),
                            onPressed: () {})),
                  ],
                ))
          ])),
    );
  }
}