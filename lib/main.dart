import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:munchease/utils/app_bindings.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:munchease/utils/theme_utils.dart';
import 'utils/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  MunchBox boxInterface = MunchBox();
  await boxInterface.openBoxes();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 150),
        themeMode: ThemeMode.dark,
        theme: MunchTheme.lightTheme,
        darkTheme: MunchTheme.darkTheme,
        // Run some initial bindings for controllers.
        initialBinding: AppBinding(),
        // The initial route this can be changed to the splash screen route as well.
        // TODO:change back to home route
        initialRoute: Routes.CUISINE,
        // Predefined pages.
        getPages: AppPages.pages);
  }
}
