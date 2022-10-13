import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/app_bindings.dart';
import 'package:munchease/utils/theme_utils.dart';

import 'utils/app_pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.light,
        theme: MunchTheme.lightTheme,
        darkTheme: MunchTheme.darkTheme,
        // Run some initial bindings for controllers.
        initialBinding: AppBinding(),
        // The initial route this can be changed to the splash screen route as well.
        initialRoute: '/',
        // Predefined pages.
        getPages: AppPages.pages);
  }
}
