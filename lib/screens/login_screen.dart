import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/login_screen_controller.dart';

// The UI for the login screen.
class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('LoginScreenPage')),
        body: const SafeArea(child: Text('LoginScreenController')));
  }
}
