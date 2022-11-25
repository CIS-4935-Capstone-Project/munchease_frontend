import 'package:get/get.dart';
import 'package:munchease/utils/app_boxes.dart';

import '../models/recipe_model.dart';

// Controlls the login screen interactions
class HomeScreenController extends GetxController
    with StateMixin<Recipe>, CuisineBox {
  // When the controller get initialized
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 3))
        .then((value) => change(null, status: RxStatus.success()));
  }
}
