import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/theme_utils.dart';
import '../utils/login_provider.dart';
import 'dart:convert';

// Controlls the login screen interactions
class ResetController extends GetxController {
  // When the controller get initialized
  TextEditingController emailController = TextEditingController();
  bool emailValidated = false;
  @override
  void onInit() {
    super.onInit();
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

  Future<void> submitForm(email) async {
    /* 
    Pop up with a dialog if the email is not validated or passwords don't match.
    Passwords are assumed to be fine as the account is already created.
    TODO: add password complexity validation as well
    If both those cases are fine, submit the form
    if successful, message/id/rfrshTkn returned
    if fail, only "message" field returned
    */
    LoginProvider loginprovider = LoginProvider();
    if (!emailValidated) {
      Get.defaultDialog(
        title: 'Invalid Credentials',
        textConfirm: 'OK',
        titleStyle: const TextStyle(
            fontFamily: 'Inter', fontSize: 18.0, fontWeight: FontWeight.w700),
        middleText: 'Ensure your email is valid',
        middleTextStyle: const TextStyle(fontFamily: 'Inter', fontSize: 14),
        buttonColor: MunchColors.primaryColor,
        onConfirm: () => Get.back(),
      );
    } else {
      dynamic res = await loginprovider.resetPassword({"email": email});
      if (res['email']) {
        Get.defaultDialog(
          title: 'Request Sent',
          textConfirm: 'Sign In',
          titleStyle: const TextStyle(
              fontFamily: 'Inter', fontSize: 18.0, fontWeight: FontWeight.w700),
          middleText:
              'Check your email\n${emailController.text}\nfor your password reset email',
          middleTextStyle: const TextStyle(fontFamily: 'Inter', fontSize: 14),
          buttonColor: MunchColors.primaryColor,
          onConfirm: () => Get.toNamed('/signin'),
        );
      } else {
        Get.defaultDialog(
          title: 'Sign Up Failed',
          textConfirm: 'OK',
          titleStyle: const TextStyle(
              fontFamily: 'Inter', fontSize: 18.0, fontWeight: FontWeight.w700),
          middleText:
              'Failure during password reset.\nPlease try again or sign in',
          middleTextStyle: const TextStyle(fontFamily: 'Inter', fontSize: 14),
          buttonColor: MunchColors.primaryColor,
          onConfirm: () => Get.back(),
        );
      }
    }
  }

  void toSignin() {
    /*
    Reset the opacity of the form/header elements so when the user comes back
    to the page it will redo the transition.
    */
    // formOpacity.value = 0.0;
    // headerOpacity.value = 0.0;
    Get.toNamed('/signin');
  }
}
