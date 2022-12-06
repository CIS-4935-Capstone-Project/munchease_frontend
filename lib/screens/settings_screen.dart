import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/app_pages.dart';
import 'package:munchease/widgets/global_widgets.dart';
import 'package:munchease/widgets/me_text_button.dart';
import 'package:munchease/widgets/theme_toggle_button.dart';

import '../utils/app_boxes.dart';

class SettingsScreen extends StatelessWidget with ThemeBox {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTitleAppBar('Settings'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MunchButton(
                buttonType: MunchButtonType.filled,
                child: const Text("Sign Out"),
                onPressed: () {
                  Get.toNamed(Routes.INITIAL);
                }),
            const SizedBox(
              height: 20,
            ),
            MunchButton(
                buttonType: MunchButtonType.filled,
                child: const Text("Clear Data"),
                onPressed: () {
                  Get.defaultDialog(
                      title:
                          "Warning this will delete all your data related to MunchEase",
                      contentPadding: const EdgeInsets.all(20),
                      backgroundColor: Theme.of(context).colorScheme.background,
                      confirmTextColor:
                          Theme.of(context).colorScheme.background,
                      onCancel: (() {
                        Get.back();
                      }),
                      onConfirm: () async {
                        await MunchBox().deleteBoxes();
                        Get.toNamed(Routes.INITIAL);
                      });
                }),
            const SizedBox(
              height: 20,
            ),
            MunchButton(
              buttonType: MunchButtonType.line,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Toggle Theme"),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(Theme.of(context).brightness == Brightness.dark
                      ? Icons.light_mode
                      : Icons.dark_mode)
                ],
              ),
              onPressed: () {
                Get.theme.brightness == Brightness.dark
                    ? putTheme('light')
                    : putTheme('dark');
                Get.changeThemeMode(Get.theme.brightness == Brightness.dark
                    ? ThemeMode.light
                    : ThemeMode.dark);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // MunchButton(
            //   buttonType: MunchButtonType.line,
            //   child: Container(),
            //   onPressed: () {},
            // )
          ],
        ),
      ),
    );
  }
}
