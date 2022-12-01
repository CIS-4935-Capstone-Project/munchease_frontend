import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/onboarding_diet_controller.dart';
import 'package:munchease/widgets/global_widgets.dart';
import 'package:munchease/widgets/me_filterchip.dart';
import 'package:munchease/widgets/me_text_button.dart';

import '../utils/app_pages.dart';
import '../widgets/diet_filter_grid.dart';

//ignore: must_be_immutable
class OnboardingDietScreen extends StatelessWidget {
  OnboardingDietScreen({super.key});
  OnboardingDietController controller = Get.find();
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
            Expanded(child: DietFilterGrid(controller: controller)),
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
                            onPressed: () {
                              Get.toNamed('/home');
                            })),
                  ],
                )),
            const SizedBox(height: 10)
          ])),
    );
  }
}
