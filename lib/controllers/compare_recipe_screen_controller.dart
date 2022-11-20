import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/app_pages.dart';

import '../models/recipe_model.dart';
import '../utils/app_boxes.dart';

class CompareRecipeScreenController extends GetxController with FavoriteBox {
  final _pageController = PageController().obs;
  get pageController => _pageController.value;
  final _pageIndex = 0.obs;
  set index(value) => _pageIndex.value = value;
  get index => _pageIndex.value;

  List<Recipe> recipeList;

  CompareRecipeScreenController({required this.recipeList});

  void previousPage() {
    if (index != 0) {
      index = index - 1;
      _pageController.value.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void nextPage() {
    if (index != recipeList.length - 1) {
      index = index + 1;
      _pageController.value.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void goToIndex(int value) {
    index = value;
    _pageController.value.animateToPage(value,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void addToFavorites() async {
    await putFavorites(recipeList[index].toJson());
    Get.toNamed(Routes.FINAL, arguments: {"recipe": recipeList[index]});
  }
}
