import 'package:get/get.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/recipe_model.dart';

class FinalRecipeScreenController extends GetxController
    with StateMixin<Recipe>, FavoriteBox {
  FinalRecipeScreenController({
    required Recipe recipe,
  }) {
    change(recipe);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    handleLoading();
  }

  handleLoading() {
    if (state!.analyzedInstructions!.length == 0) {
      change(state, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.loading());
      // TODO: try catch get recipe from server using the id
    }
  }
}
