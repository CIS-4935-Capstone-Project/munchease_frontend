import 'package:get/get.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:munchease/utils/server_helper.dart';
import '../models/recipe_model.dart';
import 'package:munchease/utils/app_pages.dart';

// Controlls the login screen interactions
class HomeScreenController extends GetxController
    with StateMixin<Recipe>, CuisineBox, DietBox, FavoriteBox {
  // List<String>? cuisines;
  int? dietIndex;
  RxList recipes = RxList.empty();
  List<Recipe> comparedRecipes = [];

  // When the controller get initialized
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    // cuisines = getCuisine();
    dietIndex = getDiet() ?? 0;
    getRandomRecipes(dietIndex);
  }

  void getRandomRecipes(int? dietIndex) async {
    Server recipeProvider = Get.find();
    var temp = await recipeProvider.getRecipes(dietIndex);
    recipes = RxList.from(temp);
    change(null, status: RxStatus.success());
  }

  void addToFavorites(index) async {
    // adds to favorites and compare
    await putFavorites(recipes[index].toJson());
    comparedRecipes.add(recipes[index]);
    if (checkTotalRecipes(comparedRecipes, index)) {
      Get.toNamed(Routes.COMPARE, arguments: {"recipeList": comparedRecipes});
    }
  }

  void addToCompare(index) {
    // add to compare only
    comparedRecipes.add(recipes[index]);
    if (checkTotalRecipes(comparedRecipes, index)) {
      Get.toNamed(Routes.COMPARE, arguments: {"recipeList": comparedRecipes});
    }
  }

  bool checkTotalRecipes(List comparedRecipes, index) {
    if (comparedRecipes.length == 3 || index == recipes.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
