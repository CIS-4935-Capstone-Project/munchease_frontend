import 'package:get/get.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:munchease/utils/server_helper.dart';
import '../models/recipe_model.dart';

class FinalRecipeScreenController extends GetxController
    with StateMixin<Recipe> {
  Server server;

  FinalRecipeScreenController({required Recipe recipe, required this.server}) {
    print(recipe);
    change(recipe);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    handleLoading();
  }

  handleLoading() async {
    if (state!.spoonacularSourceUrl != null) {
      change(state, status: RxStatus.success());
    } else {
      change(state, status: RxStatus.loading());
      // TODO: try catch get recipe from server using the id
      var serverRecipe = await server.getRecipeFromId(state!.id);

      change(serverRecipe, status: RxStatus.success());
    }
  }
}
