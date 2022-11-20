import 'package:get/get.dart';
import 'package:munchease/models/recipe_model.dart';
import 'package:munchease/utils/app_boxes.dart';

class SavedRecipeScreenController extends GetxController
    with StateMixin<List<Recipe>>, FavoriteBox {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    change(null, status: RxStatus.loading());
    var recipeShell =
        (getFavorites() ?? []).map((e) => Recipe.fromHive(e)).toList();
    change(recipeShell, status: RxStatus.success());
  }
}
