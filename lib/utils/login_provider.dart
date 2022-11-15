import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future<Map<String, String>> registerUser(Map data) async {
    final response = await post('https://5cswfu.deta.dev/register', data);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response.body;
    }
  }

  Future<Response> signIn(Map data) => post('signinURL', data);

  Future<Map<String, String>> getLandingPage() async {
    try {
      final response = await get('https://5cswfu.deta.dev/');
      if (response.status.hasError) {
        return Future.error(Exception(response.statusText));
      } else {
        return {"response": response.body.toString()};
      }
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
