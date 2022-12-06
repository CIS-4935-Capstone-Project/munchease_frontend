import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/splash_screen_controller.dart';
import 'package:munchease/utils/theme_utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import '../controllers/signin_screen_controller.dart';
import '../widgets/me_text_button.dart';

//ignore: must_be_immutable
class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  SplashScreenController splashController = Get.find();
  final _formKey = GlobalKey<FormState>();
  bool shouldPop = false;

  @override
  Widget build(BuildContext context) {
    final signinController =
        Get.put(SigninScreenController(), tag: '$hashCode');
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    // logo
                    width: 100,
                    height: 100,
                    child: Hero(
                        tag: 'logo',
                        child: Rive(
                          artboard: splashController.birdArtboard,
                        )),
                  ),
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
                              child: ObxValue(
                                  (data) => TextFormField(
                                        controller:
                                            signinController.passController,
                                        obscureText: data.value,
                                        decoration: InputDecoration(
                                          label: const Text(
                                            "Password",
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(data.value
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                            onPressed: () => data.toggle(),
                                          ),
                                        ),
                                      ),
                                  true.obs)),
                          SizedBox(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Obx((() => SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: Checkbox(
                                          activeColor: MunchColors.primaryColor,
                                          checkColor: MunchColors.primaryDark,
                                          value: signinController
                                              .checkboxValue.value,
                                          onChanged: (val) {
                                            signinController.checkboxValue
                                                .toggle();
                                          }),
                                    ))),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(11.5, 0, 0, 0),
                                  child: Text(
                                    'Remember Me',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 300,
                            child: GestureDetector(
                              onTap: () => {
                                Get.toNamed('/reset'),
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.lock_reset,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(11.5, 0, 0, 0),
                                      child: Text(
                                        'Forgot your password?',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontFamily: 'Quicksand',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            height: 120,
                          ),
                          signinController.obx(
                            (state) => (MunchButton(
                                buttonType: MunchButtonType.filled,
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () {
                                  signinController.submitForm(
                                      signinController.emailController.text,
                                      signinController.passController.text);
                                })),
                            onLoading: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircularProgressIndicator(),
                            ),
                          ),
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
                                Get.toNamed('/register');
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
