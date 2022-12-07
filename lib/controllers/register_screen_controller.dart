import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:munchease/utils/theme_utils.dart';
import '../utils/app_pages.dart';
import '../utils/login_provider.dart';
import 'dart:convert';
import '../utils/app_boxes.dart';

class RegisterScreenController extends GetxController
    with StateMixin, RememberUser, UserToken {
  // When the controller get initialized
  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxBool checkboxValue = false.obs;
  bool passValidated = false; // passwords match
  bool emailValidated = false;
  RxDouble formOpacity = 0.0.obs;
  RxDouble headerOpacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      headerOpacity.value = 1.0;
    });
    Future.delayed(const Duration(milliseconds: 1500)).then((value) {
      formOpacity.value = 1.0;
    });
  }

  void rememberMe(String email, String password) {
    if (checkboxValue.isTrue) {
      /*
      when they hit submit, if they checked the box then store in the local DB
      their choice and save their login
      */
      putUser({"email": email, "password": password});
    }
  }

  String? passwordValidator() {
    /*
    Check if password and confirm password fields match.  If they do, 
    toggle the control variable for sending the validated fields.
    Returns a string to the text field to display the error message
    */
    if (passController.text.length < 9) {
      passValidated = false;
      return 'Password length must be greater than 8';
    } else if (passController.value == confirmController.value) {
      passValidated = true;
      return null;
    } else {
      passValidated = false;
      return 'Passwords must match';
    }
  }
  //TODO: add validation function for passwords
  //TODO: onchanged to true.obs
  //TODO: add backend post request function

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
    Pop up with a dialog if the email is not validated or passwords don't match.
    Passwords are assumed to be fine as the account is already created.
    TODO: add password complexity validation as well
    If both those cases are fine, submit the form
    if successful, message/id/rfrshTkn returned
    if fail, only "message" field returned
    */
    LoginProvider loginProvider = Get.find();
    if (!passValidated || !emailValidated) {
      Get.defaultDialog(
        title: 'Invalid Credentials',
        textConfirm: 'OK',
        titleStyle: const TextStyle(
            fontFamily: 'Inter', fontSize: 18.0, fontWeight: FontWeight.w700),
        middleText: 'Ensure your email is valid and passwords match',
        middleTextStyle: const TextStyle(fontFamily: 'Inter', fontSize: 14),
        buttonColor: MunchColors.primaryColor,
        confirmTextColor: MunchColors.primaryLight,
        onConfirm: () => Get.back(),
      );
    } else {
      change(null, status: RxStatus.loading());
      try {
        Map res = await loginProvider
            .registerUser({"email": email, "password": password});
        change(null, status: RxStatus.success());
        Get.defaultDialog(
          title: 'Registration Complete',
          textConfirm: 'Let\'s Go!',
          titleStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              color: MunchColors.primaryLight),
          middleText: '',
          middleTextStyle: const TextStyle(fontFamily: 'Inter', fontSize: 14),
          buttonColor: MunchColors.primaryColor,
          confirmTextColor: MunchColors.primaryLight,
          onConfirm: () {
            newUserSignin(loginProvider, email, password);
          },
        );
      } on Exception catch (e) {
        change(null, status: RxStatus.success());
        Get.defaultDialog(
          title: 'Sign Up Failed',
          textConfirm: 'OK',
          titleStyle: const TextStyle(
              fontFamily: 'Inter', fontSize: 18.0, fontWeight: FontWeight.w700),
          middleText: 'Something went wrong... 😬\nPlease try again.',
          middleTextStyle: const TextStyle(fontFamily: 'Inter', fontSize: 14),
          buttonColor: MunchColors.primaryColor,
          confirmTextColor: MunchColors.primaryLight,
          onConfirm: () {
            Get.back();
          },
        );
      }
    }
  }

  Future<void>? newUserSignin(
      LoginProvider loginProvider, String email, String password) async {
    change(null, status: RxStatus.loading());
    Map res =
        await loginProvider.signIn({"email": email, "password": password});
    change(null, status: RxStatus.success());
    if (res['message'] == 'success') {
      rememberMe(email, password);
      putToken({"id": res['id'], "rfrshTkn": res['rfrshTkn']});
      Get.toNamed(Routes.CUISINE);
    } else {
      Get.defaultDialog(
        title: 'Sign In Failed',
        textConfirm: 'Sign In',
        titleStyle: const TextStyle(
            fontFamily: 'Inter', fontSize: 18.0, fontWeight: FontWeight.w700),
        middleText: 'Something went wrong... 😬\nTry signing in again.',
        middleTextStyle: const TextStyle(fontFamily: 'Inter', fontSize: 14),
        buttonColor: MunchColors.primaryColor,
        confirmTextColor: MunchColors.primaryLight,
        onConfirm: () {
          Get.back();
        },
      );
    }
  }
}
