import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: IconButton(
          onPressed: () {
            Get.changeThemeMode(Get.theme.brightness == Brightness.dark
                ? ThemeMode.light
                : ThemeMode.dark);
          },
          icon: Icon(Theme.of(context).brightness == Brightness.dark
              ? Icons.light_mode
              : Icons.dark_mode)),
    );
  }
}
