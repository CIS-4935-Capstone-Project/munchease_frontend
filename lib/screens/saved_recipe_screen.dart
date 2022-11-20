import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/saved_recipe_screen_controller.dart';
import 'package:munchease/models/recipe_model.dart';
import 'package:munchease/utils/app_pages.dart';
import 'package:munchease/utils/theme_utils.dart';
import 'package:munchease/widgets/global_widgets.dart';

class SavedRecipeScreen extends StatelessWidget {
  const SavedRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SavedRecipeScreenController controller =
        Get.put(SavedRecipeScreenController());
    return Scaffold(
      appBar: buildTitleAppBar('Saved Recipes'),
      body: controller.obx((recipeList) => buildSavedRecipe(recipeList!),
          onLoading: buildProgressIndicator()),
    );
  }

  SingleChildScrollView buildSavedRecipe(List<Recipe> recipeList) {
    return SingleChildScrollView(
      child: Column(
          children: recipeList
              .map((e) => Material(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.FINAL, arguments: {"recipe": e});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: MunchColors.primaryColor)),
                        margin: const EdgeInsets.all(10),
                        child: buildIngredientRow(e),
                      ),
                    ),
                  ))
              .toList()),
    );
  }

  Row buildIngredientRow(Recipe e) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            e.image!,
            height: 56,
            width: 56,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(child: Text(e.title!)),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_right_outlined),
          onPressed: () {
            Get.toNamed(Routes.FINAL, arguments: {"recipe": e});
          },
        )
      ],
    );
  }
}
