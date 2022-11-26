import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future registerUser(Map data) async {
    final response = await post('https://munchease.deta.dev/register', data);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response.body;
    }
  }

  Future signIn(Map data) async {
    final response = await post('https://munchease.deta.dev/signin', data);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response.body;
    }
  }

  Future resetPassword(Map data) async {
    final response = await post('https://munchease.deta.dev/reset', data);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response.body;
    }
  }
} // end class
