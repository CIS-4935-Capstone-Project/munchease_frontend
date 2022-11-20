import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:munchease/widgets/me_detailed_recipe.dart';

import '../controllers/final_recipe_screen_controller.dart';
import '../models/recipe_model.dart';

class FinalRecipeScreen extends StatelessWidget {
  const FinalRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FinalRecipeScreenController controller = Get.put(
        FinalRecipeScreenController(
            recipe: Get.arguments['recipe'], server: Get.find()),
        tag: Get.arguments['recipe'].id.toString());
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: controller.obx(
              (state) => MunchDetailedRecipe(
                    recipe: state!,
                  ),
              onLoading: const Center(child: CircularProgressIndicator())),
        ));
  }
}
