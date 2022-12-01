import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/compare_recipe_screen_controller.dart';
import '../models/recipe_model.dart';
import '../utils/app_scroll_util.dart';
import '../widgets/me_arrow_button.dart';
import '../widgets/me_detailed_recipe.dart';
import '../widgets/me_text_button.dart';

//ignore: must_be_immutable
class CompareRecipeScreen extends StatelessWidget {
  CompareRecipeScreen({
    super.key,
  });

  bool shouldPop = false;

  @override
  Widget build(BuildContext context) {
    List<Recipe> compareList = Get.arguments['recipeList'];
    final controller =
        Get.put(CompareRecipeScreenController(recipeList: compareList));

    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
          bottomNavigationBar: buildBottomNavigationBar(context, controller),
          body: SafeArea(
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...buildPageIndicator(controller, compareList, context)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildPageView(controller, compareList),
              ],
            ),
          )),
    );
  }

  Expanded buildPageView(
      CompareRecipeScreenController controller, compareList) {
    return Expanded(
      child: ScrollConfiguration(
        behavior: MouseDraggableScrollBehavior(),
        child: PageView(
          controller: controller.pageController,
          onPageChanged: (value) {
            controller.index = value;
          },
          children: [
            ...compareList.asMap().entries.map((e) {
              return MunchDetailedRecipe(
                recipe: e.value,
              );
            }).toList()
          ],
        ),
      ),
    );
  }

  List<GestureDetector> buildPageIndicator(
      CompareRecipeScreenController controller,
      List<Recipe> compareList,
      BuildContext context) {
    return compareList.asMap().entries.map((e) {
      return GestureDetector(
        onTap: () {
          controller.goToIndex(e.key);
        },
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
              color: e.key == controller.index
                  ? Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black
                  : const Color.fromARGB(255, 78, 78, 78),
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(10),
          width: 40,
          height: 10,
        ),
      );
    }).toList();
  }

  SizedBox buildBottomNavigationBar(
      BuildContext context, CompareRecipeScreenController controller) {
    return SizedBox(
        height: 75,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MunchArrowButton(
              child: Transform.scale(
                  scaleX: -1,
                  child: Icon(Icons.play_arrow,
                      color: Theme.of(context).colorScheme.background)),
              onPressed: () {
                controller.previousPage();
              },
            ),
            SizedBox(
              width: 130,
              child: MunchButton(
                  radius: 10,
                  buttonType: MunchButtonType.line,
                  child: const Text("Pick"),
                  onPressed: () {
                    controller.addToFavorites();
                  }),
            ),
            MunchArrowButton(
              child: Icon(
                Icons.play_arrow,
                color: Theme.of(context).colorScheme.background,
              ),
              onPressed: () {
                controller.nextPage();
              },
            ),
          ],
        ));
  }
}
