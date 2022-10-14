import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/theme_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MunchColors.primaryDark,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/images/logo.png')),
          Image.asset('assets/images/logo_text.png')
        ]),
      ),
    );
  }
}
