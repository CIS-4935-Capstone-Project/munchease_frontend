import 'package:get/get.dart';
import 'package:munchease/models/recipe_model.dart';
import 'package:munchease/screens/final_recipe_screen.dart';
import 'package:munchease/screens/onboarding_diet_screen.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:munchease/utils/sample_models.dart';
import '../screens/compare_recipe_screen.dart';
import '../screens/login_screen.dart';
import '../screens/onboarding_cuisine_screen.dart';
import '../screens/splash_screen.dart';
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
    GetPage(
        name: Routes.FINAL,
        page: (() => FinalRecipeScreen(
              recipe:
                  Recipe.fromHive(MunchBox.favRepo.get('user_favorites')[1]),
            )))
  ];
}
