import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future<Response> registerUser(Map data) async {
    final response = await post('registerurl', data);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response.body;
    }
  }

  Future<Response> signIn(Map data) => post('signinURL', data);

  Future<Response> getBeer() async {
    final response = await get('https://random-data-api.com/api/v2/beer');
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      return response.body;
    }
  }
}
