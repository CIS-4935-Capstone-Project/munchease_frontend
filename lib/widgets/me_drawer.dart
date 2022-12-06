import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/app_pages.dart';
import 'package:munchease/utils/theme_utils.dart';
import 'package:munchease/widgets/drawer_tile.dart';
import 'package:munchease/widgets/theme_toggle_button.dart';

class MunchDrawer extends StatelessWidget {
  const MunchDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      width: 300,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black.withOpacity(0.8)
            : Colors.white.withOpacity(0.8),
        child: Stack(
          children: [
            SizedBox(
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[500]!.withOpacity(0.1)
                          : Colors.white.withOpacity(0.31),
                    ),
                  ),
                ),
              ),
            ),
            DefaultTextStyle.merge(
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  DrawerTile(
                    title: "Home",
                    onTap: () {
                      Get.currentRoute == Routes.HOME
                          ? Get.back()
                          : Get.toNamed(Routes.HOME);
                    },
                  ),
                  DrawerTile(
                    title: "Saved Recipes",
                    onTap: () {
                      Get.currentRoute == Routes.SAVED
                          ? Get.back()
                          : Get.toNamed(Routes.SAVED);
                    },
                  ),
                  DrawerTile(
                    title: "Profile",
                    onTap: () {
                      Get.currentRoute == Routes.PROFILE
                          ? Get.back()
                          : Get.toNamed(Routes.PROFILE);
                    },
                  ),
                  DrawerTile(
                    title: "Settings",
                    onTap: () {
                      Get.currentRoute == Routes.SETTINGS
                          ? Get.back()
                          : Get.toNamed(Routes.SETTINGS);
                    },
                  ),
                  const Spacer(),
                  ThemeToggle(),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
