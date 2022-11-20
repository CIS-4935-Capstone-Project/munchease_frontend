import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/models/recipe_model.dart';
import 'package:munchease/screens/compare_recipe_screen.dart';
import 'package:munchease/screens/final_recipe_screen.dart';
import 'package:munchease/screens/onboarding_cuisine_screen.dart';
import 'package:munchease/screens/onboarding_diet_screen.dart';
import 'package:munchease/screens/saved_recipe_screen.dart';
import 'package:munchease/screens/splash_screen.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:munchease/utils/sample_models.dart';
import 'package:munchease/widgets/image_popup.dart';
import 'package:munchease/widgets/me_detailed_recipe.dart';

part 'app_routes.dart';

// Define pages here
abstract class AppPages {
  static final pages = [
    // TODO: add new GetPages by typing getpageroute
    GetPage(name: Routes.INITIAL, page: () => SplashScreen()),
    GetPage(
        name: Routes.CUISINE, page: (() => const OnboardingCuisineScreen())),
    GetPage(name: Routes.DIET, page: (() => const OnboardingDietScreen())),
    GetPage(
        name: Routes.COMPARE,
        page: (() => CompareRecipeScreen(
              compareList: recipeModelSample,
            ))),
    GetPage(name: Routes.FINAL, page: (() => FinalRecipeScreen())),
    GetPage(name: Routes.SAVED, page: (() => const SavedRecipeScreen())),

    GetPage(
        name: Routes.IMAGE,
        page: (() => ImagePopup()),
        opaque: false,
        showCupertinoParallax: false,
        transition: Transition.fade)
  ];
}
