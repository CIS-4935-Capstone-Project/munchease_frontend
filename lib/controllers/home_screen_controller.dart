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
    if (comparedRecipes.length == 3) {
      Get.toNamed(Routes.COMPARE, arguments: {"recipeList": comparedRecipes});
      return;
    }
    // adds to favorites and compare
    await putFavorites(recipes[index].toJson());
    comparedRecipes.add(recipes[index]);
    checkTotalRecipes(comparedRecipes, index);
  }

  void addToCompare(index) {
    if (comparedRecipes.length == 3) {
      Get.toNamed(Routes.COMPARE, arguments: {"recipeList": comparedRecipes});
      return;
    }
    // add to compare only
    comparedRecipes.add(recipes[index]);
    checkTotalRecipes(comparedRecipes, index);
  }

  void checkTotalRecipes(List comparedRecipes, int index) {
    if (comparedRecipes.length == 3) {
      Get.toNamed(Routes.COMPARE, arguments: {"recipeList": comparedRecipes});
    } else {
      checkListLength(index);
    }
  }

  void checkListLength(index) {
    if (index == recipes.length - 1 && comparedRecipes.length < 3) {
      change(null, status: RxStatus.loading());
      getRandomRecipes(0);
    }
  }

  void backToHomeHelper() {
    change(null, status: RxStatus.loading());
    comparedRecipes = [];
    getRandomRecipes(0);
  }
}
