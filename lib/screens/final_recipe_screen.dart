import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/widgets/me_detailed_recipe.dart';
import 'package:munchease/widgets/me_text_button.dart';

import '../controllers/final_recipe_screen_controller.dart';

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
              (state) => SingleChildScrollView(
                    child: Column(
                      children: [
                        MunchDetailedRecipe(
                          recipe: state!,
                        ),
                        MunchButton(
                            buttonType: MunchButtonType.filled,
                            child: const Text("Search Near You"),
                            onPressed: () async {
                              controller.launchMapURL();
                            })
                      ],
                    ),
                  ),
              onLoading: const Center(child: CircularProgressIndicator())),
        ));
  }
}
