import 'package:get/get.dart';
import 'package:munchease/screens/compare_recipe_screen.dart';
import 'package:munchease/screens/final_recipe_screen.dart';
import 'package:munchease/screens/onboarding_cuisine_screen.dart';
import 'package:munchease/screens/profile_screen.dart';
import 'package:munchease/screens/reset_screen.dart';
import 'package:munchease/screens/signin_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import 'package:munchease/screens/onboarding_diet_screen.dart';
import 'package:munchease/screens/saved_recipe_screen.dart';
import 'package:munchease/screens/splash_screen.dart';
import 'package:munchease/utils/sample_models.dart';
import 'package:munchease/widgets/image_popup.dart';

part 'app_routes.dart';

// Define pages here
abstract class AppPages {
  static final pages = [
    // TODO: add new GetPages by typing getpageroute
    GetPage(name: Routes.INITIAL, page: () => SplashScreen()),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
    GetPage(
      name: Routes.SIGNIN,
      page: () => SigninScreen(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.RESET,
      page: () => ResetScreen(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(name: Routes.CUISINE, page: (() => OnboardingCuisineScreen())),
    GetPage(name: Routes.DIET, page: (() => OnboardingDietScreen())),
    GetPage(name: Routes.COMPARE, page: (() => CompareRecipeScreen())),
    GetPage(name: Routes.FINAL, page: (() => FinalRecipeScreen())),
    GetPage(name: Routes.SAVED, page: (() => const SavedRecipeScreen())),

    GetPage(
        name: Routes.IMAGE,
        page: (() => ImagePopup()),
        opaque: false,
        showCupertinoParallax: false,
        transition: Transition.fade),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}
