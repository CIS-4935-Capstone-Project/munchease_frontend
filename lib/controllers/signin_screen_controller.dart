import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// Controlls the login screen interactions
class SigninScreenController extends GetxController {
  // When the controller get initialized
  TextEditingController passController = TextEditingController();
  RxBool checkboxValue = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
