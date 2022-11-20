import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/splash_screen_controller.dart';
import 'package:munchease/utils/theme_utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import '../controllers/signin_screen_controller.dart';
import '../widgets/me_text_button.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final signinController = Get.put(SigninScreenController());
  SplashScreenController splashController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                opacity: signinController.headerOpacity.value,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeIn,
                child: const SizedBox(
                  // below logo padding
                  height: 60,
                  child: Center(
                    child: Text(
                      'Sign In',
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
                opacity: signinController.formOpacity.value,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeIn,
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 80,
                        child: TextFormField(
                            validator: ((value) {
                              return signinController.emailValidator();
                            }),
                            controller: signinController.emailController,
                            decoration: const InputDecoration(
                                label: Text(
                              "Email Address",
                            ))),
                      ), //padding box
                      SizedBox(
                        width: 300,
                        height: 80,
                        child: TextFormField(
                          controller: signinController.passController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              label: Text(
                            "Password",
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 325,
                        child: Row(
                          children: [
                            Obx((() => Checkbox(
                                activeColor: MunchColors.primaryColor,
                                checkColor: MunchColors.primaryDark,
                                value: signinController.checkboxValue.value,
                                onChanged: (val) {
                                  signinController.checkboxValue.toggle();
                                }))),
                            const Text(
                              'Remember Me',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ), //TODO add link to forgot password screen with lock icon
                      SizedBox(
                        width: 308,
                        child: GestureDetector(
                          onTap: () => {
                            Get.toNamed('/reset'),
                          },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.lock_reset,
                                  size: 28.0,
                                ),
                                Text(
                                  '  Forgot your password?',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 15.0,
                                  ),
                                )
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                      MunchButton(
                          buttonType: MunchButtonType.filled,
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onPressed: () {
                            signinController.submitForm();
                          }),
                      const SizedBox(height: 10),
                      MunchButton(
                          buttonType: MunchButtonType.line,
                          child: const Text(
                            "Need an Account?",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          onPressed: () {
                            signinController.toRegister();
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
