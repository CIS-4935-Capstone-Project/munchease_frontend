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
        body: Center(
            child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          // top padding box
          height: 40,
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
        Obx(
          () => AnimatedOpacity(
            opacity: registerController.headerOpacity.value,
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeIn,
            child: const SizedBox(
              // below logo padding
              height: 60,
              child: Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => AnimatedOpacity(
            opacity: registerController.formOpacity.value,
            duration: const Duration(seconds: 2),
            curve: Curves.easeIn,
            child: Expanded(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                          validator: ((value) {
                            return registerController.emailValidator();
                          }),
                          controller: registerController.emailController,
                          decoration: const InputDecoration(
                              label: Text(
                            "Email Address",
                          ))),
                    ),
                    const SizedBox(
                      height: 20,
                    ), //padding box
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: registerController.passController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            label: Text(
                          "Password",
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ), // padding boxR
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          return registerController.passwordValidator();
                        },
                        controller: registerController.confirmController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            label: Text(
                          "Confirm Password",
                        )),
                      ),
                    ),
                    //const SizedBox(height: 10),
                    SizedBox(
                      width: 325,
                      child: Row(
                        children: [
                          Obx((() => Checkbox(
                              activeColor: MunchColors.primaryColor,
                              checkColor: MunchColors.primaryDark,
                              value: registerController.checkboxValue.value,
                              onChanged: (val) {
                                registerController.checkboxValue.toggle();
                              }))),
                          const Text('Remember Me'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    MunchButton(
                        buttonType: MunchButtonType.filled,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {
                          registerController.submitForm();
                        }),
                    const SizedBox(height: 10),
                    MunchButton(
                        buttonType: MunchButtonType.line,
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {
                          //navigate to login page
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    )));
  }
}
