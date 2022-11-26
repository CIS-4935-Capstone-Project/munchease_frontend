import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/app_boxes.dart';
import '../utils/login_provider.dart';
import '../utils/theme_utils.dart';

// Controlls the login screen interactions
class SigninScreenController extends GetxController with RememberUser {
  // When the controller get initialized
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool emailValidated = false;
  RxDouble formOpacity = 0.0.obs;
  RxDouble headerOpacity = 0.0.obs;
  RxBool checkboxValue = false.obs;
  dynamic args = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    if (args != null) {
      emailController.text = args['email'];
      passController.text = args['password'];
      emailValidated = true;
    }
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      headerOpacity.value = 1.0;
    });
    Future.delayed(const Duration(milliseconds: 1500)).then((value) {
      formOpacity.value = 1.0;
    });
  }

  String? emailValidator() {
    /*
    Check if the email is empty and validate if it is formatted,
    if neither are true, it will set the control variable to true, otherwise,
    displays an error message
    */
    if (emailController.text == '' || !GetUtils.isEmail(emailController.text)) {
      emailValidated = false;
      return "Please enter a valid email address";
    } else {
      emailValidated = true;
      return null;
    }
  }

  Future<void> submitForm(String email, String password) async {
    /* 
    Pop up with a dialog if the email is not validated.
    Passwords are assumed to be fine as the account is already created.
    If both those cases are fine, submit the form
    */
    LoginProvider loginProvider = LoginProvider();
    if (!emailValidated) {
      Get.defaultDialog(
        title: 'Login Error',
        textConfirm: 'OK',
        titleStyle: const TextStyle(
            fontFamily: 'Inter', fontSize: 18.0, fontWeight: FontWeight.w700),
        middleText: 'Please submit only a valid email address',
        middleTextStyle: const TextStyle(fontFamily: 'Inter', fontSize: 14),
        buttonColor: MunchColors.primaryColor,
        onConfirm: () => Get.back(),
      );
    } else {
      dynamic res =
          await loginProvider.signIn({"email": email, "password": password});
      if (res['message'] == 'success') {
        Get.toNamed('/home');
      } else {
        Get.defaultDialog(
          title: 'Sign In Failed',
          textConfirm: 'OK',
          titleStyle: const TextStyle(
              fontFamily: 'Inter', fontSize: 18.0, fontWeight: FontWeight.w700),
          middleText: res['message'],
          middleTextStyle: const TextStyle(fontFamily: 'Inter', fontSize: 14),
          buttonColor: MunchColors.primaryColor,
          onConfirm: () {
            Get.back();
          },
        );
      }
    }
  }
}
