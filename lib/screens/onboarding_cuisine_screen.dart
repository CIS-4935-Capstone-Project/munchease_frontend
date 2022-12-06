import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/onboarding_cuisine_controller.dart';
import 'package:munchease/widgets/cuisine_filter_grid.dart';
import 'package:munchease/widgets/global_widgets.dart';
import 'package:munchease/widgets/me_drawer.dart';
import 'package:munchease/widgets/me_filterchip.dart';

import '../utils/app_pages.dart';
import '../widgets/me_text_button.dart';

//ignore: must_be_immutable
class OnboardingCuisineScreen extends StatelessWidget {
  OnboardingCuisineScreen({super.key});

  bool shouldPop = false;

  @override
  Widget build(BuildContext context) {
    OnboardingCuisineController controller =
        Get.put(OnboardingCuisineController(), tag: "$hashCode");
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        drawer: const MunchDrawer(),
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
                    child: CuisineFilterGrid(
                      controller: controller,
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
                            Get.toNamed(Routes.DIET,
                                arguments: controller.selectedCuisines);
                          })),
                  const SizedBox(height: 10),
                ],
              )),
        ),
      ),
    );
  }
}
