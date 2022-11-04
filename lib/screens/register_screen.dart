import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/register_screen_controller.dart';
import 'package:munchease/controllers/splash_screen_controller.dart';
import 'package:munchease/utils/theme_utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

import '../widgets/me_text_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final registerController = Get.put(RegisterScreenController());
  SplashScreenController splashController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MunchColors.primaryLight,
        body: Center(
            child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              // top padding box
              height: 60,
            ),
            SizedBox(
              // logo
              width: 100,
              height: 100,
              child: Hero(
                  tag: 'logo',
                  child: Rive(
                    artboard: splashController.birdArtboard,
                  )),
            ),
            const SizedBox(
              // below logo padding
              height: 60,
            ),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              onChanged: () {},
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 75,
                    child: TextFormField(
                        validator: ((value) {
                          if (value == null ||
                              value.isEmpty ||
                              !GetUtils.isEmail(value)) {
                            return "nope";
                          }
                          return null;
                        }),
                        decoration: const InputDecoration(
                            label: Text(
                          "Username",
                          style: TextStyle(color: MunchColors.primaryDark),
                        ))),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Password",
                              style:
                                  TextStyle(color: MunchColors.primaryDark))),
                    ),
                  ),
                  const SizedBox(height: 60), // padding box
                  MunchButton(
                      buttonType: MunchButtonType.filled,
                      child: const Text("hello"),
                      onPressed: () {
                        _formKey.currentState!.validate();
                      }),
                ],
              ),
            ),
          ]),
        )));
  }
}
