import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:munchease/utils/app_pages.dart';

class AuthGuardMiddleware extends GetMiddleware {
  var authService = Get.find<AuthService>();

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig? route) async {
    return await authService.isLoggedIn()
        ? null
        : GetNavConfig.fromRoute(Routes.CUISINE);
  }
}

class AuthService extends GetxService {
  MunchBox boxInterface = MunchBox();
  Future<bool> isLoggedIn() async {
    return await boxInterface.boxExists();
  }

  // IMPLEMENT additional FirebaseAuth methods here.
}
