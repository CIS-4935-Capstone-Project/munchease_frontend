import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/theme_utils.dart';
import '../utils/login_provider.dart';

class RegisterScreenController extends GetxController with StateMixin {
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
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      headerOpacity.value = 1.0;
    });
    Future.delayed(const Duration(milliseconds: 1500)).then((value) {
      formOpacity.value = 1.0;
    });
  }

  void rememberMe() {
    if (checkboxValue.isTrue) {
      /*
      when they hit submit, if they checked the box then store in the local DB
      their choice and save their login
      */
    } else {}
  }

  String? passwordValidator() {
    /*
    Check if password and confirm password fields match.  If they do, 
    toggle the control variable for sending the validated fields.
    Returns a string to the text field to display the error message
    */
    if (passController.value == confirmController.value) {
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

  Future<void> submitForm() async {
    /* 
    Pop up with a dialog if the email is not validated or passwords don't match.
    Passwords are assumed to be fine as the account is already created.
    TODO: add password complexity validation as well
    If both those cases are fine, submit the form
    */
    LoginProvider loginprovider = LoginProvider();
    dynamic res = loginprovider.getBeer();
    if (!passValidated || !emailValidated) {
      Get.defaultDialog(
        title: 'Invalid Credentials',
        textConfirm: 'OK',
        titleStyle: const TextStyle(
            fontFamily: 'Inter', fontSize: 18.0, fontWeight: FontWeight.w700),
        middleText: res.toString(),
        middleTextStyle: const TextStyle(fontFamily: 'Inter', fontSize: 14),
        buttonColor: MunchColors.primaryColor,
        onConfirm: () => Get.back(),
      );
    } else {}
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
