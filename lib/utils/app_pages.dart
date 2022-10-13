import 'package:get/get.dart';
import '../screens/login_screen.dart';
part 'app_routes.dart';

// Define pages here
abstract class AppPages {
  static final pages = [
    // TODO: add new GetPages by typing getpageroute
    GetPage(name: Routes.INITIAL, page: () => LoginScreen())
  ];
}
