import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/home_screen_controller.dart';
import 'package:munchease/controllers/splash_screen_controller.dart';
import 'package:munchease/controllers/swipe_controller.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:munchease/utils/app_pages.dart';
import 'package:munchease/widgets/global_widgets.dart';
import 'package:munchease/widgets/me_drawer.dart';
import 'package:munchease/widgets/me_text_button.dart';
import 'package:rive/rive.dart';
import 'package:munchease/utils/swipeable_card_stack.dart';
import 'package:munchease/widgets/me_card.dart';

//ignore: must_be_immutable
class HomeScreen extends StatelessWidget with CuisineBox, DietBox, UserToken {
  HomeScreen({super.key});
  final controller = Get.put(HomeScreenController());
  final SplashScreenController splashController = Get.find();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final SwipeableCardSectionController _cardController =
      SwipeableCardSectionController();
  bool shouldPop = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Center(child: buildIcon()),
          centerTitle: true,
          title: SizedBox(
            // logo
            width: 51,
            height: 51,
            child: Hero(
              tag: 'logo',
              child: Rive(
                artboard: splashController.birdArtboard,
              ),
            ),
          ),
        ),
        key: _key,
        drawer: const MunchDrawer(),
        body: SafeArea(
          child: Center(
            child: controller.obx(
              (state) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SwipeableCardsSection(
                    enableSwipeUp: true,
                    cardController: _cardController,
                    context: context,
                    items: [
                      ...controller.recipes
                          .sublist(0, 3)
                          .map((r) => CardView(
                                recipe: r,
                              ))
                          .toList()
                    ],
                    onCardSwiped: (dir, index, widget) {
                      if (dir == Direction.up) {
                        controller.addToFavorites(index);
                      } else if (dir == Direction.right) {
                        controller.addToCompare(index);
                      }
                      if (index + 3 <= 9) {
                        _cardController.addItem(CardView(
                          recipe: controller.recipes[index + 3],
                        ));
                      }
                      if (index == 9) {
                        controller.checkListLength(index);
                      }
                      if (index > 9 || controller.comparedRecipes.length == 3) {
                        Get.toNamed(Routes.COMPARE, arguments: {
                          "recipeList": controller.comparedRecipes
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SwipeButton(
                          icon: Icons.clear_outlined,
                          onTap: () {
                            _cardController.triggerSwipeLeft();
                          },
                          color: Colors.red,
                        ),
                        SwipeButton(
                          icon: Icons.local_fire_department,
                          onTap: () {
                            _cardController.triggerSwipeUp();
                          },
                          color: Colors.orange[600]!,
                        ),
                        SwipeButton(
                          icon: Icons.check,
                          onTap: () {
                            _cardController.triggerSwipeRight();
                          },
                          color: Colors.lightGreen,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
              onLoading: buildProgressIndicator(),
              onError: (e) => MunchButton(
                  buttonType: MunchButtonType.line,
                  child: const Text(
                    "Retry",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    controller.backToHomeHelper();
                  }),
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildIcon() {
    return InkWell(
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 4,
                width: 30,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 176, 140),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            Container(
              height: 5,
              width: 34,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 68, 68),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 4,
                width: 30,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 176, 140),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        _key.currentState!.openDrawer();
      },
      onTapCancel: () => {},
    );
  }
}

class SwipeButton extends StatelessWidget {
  final IconData icon;
  final void Function() onTap;
  final Color color;
  // final SwipeableCardSectionController controller;
  const SwipeButton(
      {Key? key,
      required this.icon,
      required this.onTap,
      // required this.controller,
      this.color = Colors.red})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFF323232)),
          child: Icon(
            icon,
            color: color,
            size: 50,
          )),
    );
  }
}
