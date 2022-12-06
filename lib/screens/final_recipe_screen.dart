import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/theme_utils.dart';
import 'package:munchease/widgets/me_detailed_recipe.dart';
import 'package:munchease/widgets/me_text_button.dart';
import '../controllers/final_recipe_screen_controller.dart';

//ignore: must_be_immutable
class FinalRecipeScreen extends StatelessWidget {
  FinalRecipeScreen({super.key});

  bool shouldPop = false;
  @override
  Widget build(BuildContext context) {
    FinalRecipeScreenController controller = Get.put(
        FinalRecipeScreenController(
          recipe: Get.arguments['recipe'],
        ),
        tag: '${Get.arguments['recipe'].id}');
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                controller.reloadHome();
              },
              child: Center(
                child: Icon(
                  Icons.home_rounded,
                  color: (Get.theme.brightness == Brightness.dark
                      ? MunchColors.primaryLight
                      : MunchColors.primaryDark),
                  size: 30,
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: controller.obx(
                (state) => SingleChildScrollView(
                      child: Column(
                        children: [
                          MunchDetailedRecipe(
                            recipe: state!,
                          ),
                          const SizedBox(height: 20),
                          MunchButton(
                              buttonType: MunchButtonType.filled,
                              child: const Text("Search Near You"),
                              onPressed: () async {
                                controller.launchMapURL();
                              }),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                onLoading: const Center(child: CircularProgressIndicator())),
          )),
    );
  }
}
