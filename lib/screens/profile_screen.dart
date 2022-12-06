import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/onboarding_cuisine_controller.dart';
import 'package:munchease/controllers/onboarding_diet_controller.dart';
import 'package:munchease/screens/onboarding_cuisine_screen.dart';
import 'package:munchease/widgets/cuisine_filter_grid.dart';
import 'package:munchease/widgets/diet_filter_grid.dart';
import 'package:munchease/widgets/global_widgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final OnboardingCuisineController cuisineController = Get.find();
  final OnboardingDietController dietController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTitleAppBar('Profile'),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              ExpansionTile(
                  initiallyExpanded: true,
                  title: const Text(
                    "Cuisines",
                    style: TextStyle(fontSize: 24),
                  ),
                  children: [
                    CuisineFilterGrid(controller: cuisineController),
                  ]),
              ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    "Diet: ${dietController.diets[dietController.selectedIndex]}",
                    style: const TextStyle(fontSize: 24),
                  ),
                  children: [DietFilterGrid(controller: dietController)]),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
