import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/register_screen_controller.dart';
import 'package:munchease/utils/theme_utils.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final registerController = Get.put(RegisterScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MunchColors.primaryDark,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            color: Colors.white70,
            child: const Center(
              child: Text(
                'HI',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
