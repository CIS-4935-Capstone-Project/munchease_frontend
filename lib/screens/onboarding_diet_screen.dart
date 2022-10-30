import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/onboarding_diet_controller.dart';
import 'package:munchease/utils/theme_utils.dart';
import 'package:munchease/widgets/me_text_button.dart';

class OnboardingDietScreen extends GetView<OnboardingDietController> {
  const OnboardingDietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: null,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 0,
        leading: Container(),
        actions: const [BackButton()],
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
        child: Obx(() =>
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
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    child: Column(
                        children: controller.diets
                            .map(
                              (e) => RadioListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text(e),
                                value: e,
                                groupValue: controller.groupValue,
                                onChanged: (value) {
                                  controller.selectDiet(value);
                                },
                              ),
                            )
                            .toList()),
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
                      child: const Text("Finish"),
                      onPressed: () {}))
            ])),
      ),
    );
  }
}
