import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future<Response> registerUser(Map data) => post('registerurl', data);

  Future<Response> signIn(Map data) => post('signinURL', data);

  Future<Response> getBeer() => get('https://random-data-api.com/api/v2/beer');
}
