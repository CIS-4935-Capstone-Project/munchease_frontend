import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/register_screen_controller.dart';
import 'package:munchease/controllers/splash_screen_controller.dart';
import 'package:munchease/utils/theme_utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import '../widgets/me_text_button.dart';

//ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final registerController = Get.put(RegisterScreenController());
  SplashScreenController splashController = Get.find();
  final _formKey = GlobalKey<FormState>();
  bool shouldPop = false;

  @override
  Widget build(BuildContext context) {
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
                    opacity: registerController.headerOpacity.value,
                    duration: const Duration(milliseconds: 1000),
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
                                return registerController.emailValidator();
                              }),
                              controller: registerController.emailController,
                              decoration: const InputDecoration(
                                label: Text(
                                  "Email Address",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 300,
                              height: 80,
                              child: ObxValue(
                                  (data) => TextFormField(
                                        controller:
                                            registerController.passController,
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
                            height: 80,
                            child: ObxValue(
                                (data) => TextFormField(
                                      validator: (value) {
                                        return registerController
                                            .passwordValidator();
                                      },
                                      controller:
                                          registerController.confirmController,
                                      obscureText: data.value,
                                      decoration: InputDecoration(
                                        label: const Text(
                                          "Confirm Password",
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(data.value
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          onPressed: () => data.toggle(),
                                        ),
                                      ),
                                    ),
                                true.obs),
                          ),
                          SizedBox(
                            width: 300,
                            child: Row(
                              children: [
                                Obx((() => SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Checkbox(
                                          activeColor: MunchColors.primaryColor,
                                          checkColor: MunchColors.primaryDark,
                                          value: registerController
                                              .checkboxValue.value,
                                          onChanged: (val) {
                                            registerController.checkboxValue
                                                .toggle();
                                          }),
                                    ))),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(11.5, 0, 0, 0),
                                  child: Text(
                                    'Remember Me',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 60),
                          registerController.obx(
                            (state) => (MunchButton(
                                buttonType: MunchButtonType.filled,
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () {
                                  registerController.submitForm(
                                      registerController.emailController.text,
                                      registerController.passController.text);
                                })),
                            onLoading: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          const SizedBox(height: 10), // padding box
                          MunchButton(
                              buttonType: MunchButtonType.line,
                              child: const Text(
                                "Have an Account?",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              onPressed: () {
                                Get.toNamed(
                                    '/signin'); //TODO change to signin when done testing
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
