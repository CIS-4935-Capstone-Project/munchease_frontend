import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/onboarding_diet_controller.dart';
import 'package:munchease/widgets/global_widgets.dart';
import 'package:munchease/widgets/me_filterchip.dart';
import 'package:munchease/widgets/me_text_button.dart';

import '../utils/app_pages.dart';

class OnboardingDietScreen extends GetView<OnboardingDietController> {
  const OnboardingDietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTitleAppBar('Diets'),
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
                              spacing: 10,
                              runSpacing: 10,
                              children: controller.diets
                                  .asMap()
                                  .entries
                                  .map((entry) => MunchChip(
                                      onSelected: (_) {
                                        controller.changeIndex(entry.key);
                                      },
                                      label: entry.value,
                                      selected: entry.key ==
                                          controller.selectedIndex))
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
                )),
            const SizedBox(height: 10)
          ])),
    );
  }
}
