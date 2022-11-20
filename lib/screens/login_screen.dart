import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/login_screen_controller.dart';
import 'package:munchease/widgets/me_filterchip.dart';
import 'package:munchease/widgets/me_text_button.dart';

// The UI for the login screen.
class LoginScreen extends GetView<LoginScreenController> {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const StadiumBorder(),
          onPressed: () {
            Get.changeThemeMode(Get.theme.brightness == Brightness.dark
                ? ThemeMode.light
                : ThemeMode.dark);
            _formKey.currentState!.validate();
          },
        ),
        body: SafeArea(
            child: Column(
          children: [
            Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                onChanged: () {},
                child: TextFormField(
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return "nope";
                      }
                      return null;
                    }),
                    decoration: const InputDecoration(hintText: "Hello"))),
            const Text('LoginScreenController'),
            const MunchChip(
              label: "Hello",
            ),
            MunchButton(
                buttonType: MunchButtonType.filled,
                child: const Text("hello"),
                onPressed: () {}),
            TextFormField(
              decoration: const InputDecoration(label: Text("Password")),
            )
          ],
        )));
  }
}
