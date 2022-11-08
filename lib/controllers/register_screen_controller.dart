import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController with StateMixin {
  // When the controller get initialized
  String? _email;
  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  RxBool checkboxValue = false.obs;

  @override
  void onInit() {
    super.onInit();
    //passcontroller.text
  }

  void rememberMe() {
    if (checkboxValue.isTrue) {
      /*
      when they hit submit, if they checked the box then store in the local DB
      their choice and save their login
      */
    } else {}
  }

  String passwordValidator() {
    if (passController.value == confirmController.value) {
      return 'Passwords Match';
    } else {
      return 'They do not match...';
    }
  }
  //TODO: add validation function for passwords
  //TODO: onchanged to true.obs
  //TODO: add backend post request function
}
