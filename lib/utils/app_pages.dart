import 'package:get/get.dart';
import 'package:munchease/screens/signin_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/splash_screen.dart';
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
        transition: Transition.rightToLeft),
    GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
    GetPage(
        name: Routes.SIGNIN,
        page: () => SigninScreen(),
        transitionDuration: const Duration(milliseconds: 300),
        transition: Transition.rightToLeft)
  ];
}
