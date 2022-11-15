import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future registerUser(Map data) async {
    final response = await post('http://10.0.2.2:3000/register', data);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response.body;
    }
  }

  Future<Response<dynamic>> signIn(Map data) => post('signinURL', data);

  Future<Response<dynamic>> getLandingPage() async {
    try {
      final response = await get('https://5cswfu.deta.dev/');
      if (response.status.hasError) {
        return Future.error(Exception(response.statusText));
      } else {
        return response.body;
      }
    } catch (e) {
      return Future.error(Exception(e));
    }
  }
}
