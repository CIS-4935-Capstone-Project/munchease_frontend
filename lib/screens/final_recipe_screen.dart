import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:munchease/widgets/me_detailed_recipe.dart';

import '../controllers/final_recipe_screen_controller.dart';
import '../models/recipe_model.dart';

class FinalRecipeScreen extends StatelessWidget with FavoriteBox {
  final Recipe recipe;
  FinalRecipeScreen({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    FinalRecipeScreenController controller =
        Get.put(FinalRecipeScreenController(recipe: recipe));
    return Scaffold(
        body: SafeArea(
      child: controller.obx(
          (state) => MunchDetailedRecipe(
                recipe: recipe,
              ),
          onLoading: const Center(child: CircularProgressIndicator())),
    ));
  }
}
