import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/reset_controller.dart';
import 'package:munchease/controllers/splash_screen_controller.dart';
import 'package:rive/rive.dart';
import '../widgets/me_text_button.dart';

class ResetScreen extends StatelessWidget {
  ResetScreen({super.key});

  final resetController = Get.put(ResetController());
  SplashScreenController splashController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const SizedBox(
                      // below logo padding
                      height: 60,
                      child: Center(
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 28.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                      width: 300,
                      height: 80,
                      child: TextFormField(
                        validator: ((value) {
                          return resetController.emailValidator();
                        }),
                        controller: resetController.emailController,
                        decoration: const InputDecoration(
                          label: Text(
                            "Email Address",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    resetController.obx(
                      (state) => (MunchButton(
                          buttonType: MunchButtonType.filled,
                          child: const Text(
                            "Send Request",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onPressed: () {
                            resetController.submitForm(
                                resetController.emailController.text);
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
                          "Back to Sign In",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed('/signin');
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
