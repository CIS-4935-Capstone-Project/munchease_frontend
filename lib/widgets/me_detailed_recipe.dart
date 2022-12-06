import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:munchease/utils/app_pages.dart';
import 'package:munchease/widgets/me_text_button.dart';
import 'package:selectable/selectable.dart';
import 'package:tinycolor2/tinycolor2.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/recipe_model.dart';

class MunchDetailedRecipe extends StatelessWidget {
  final Recipe recipe;
  const MunchDetailedRecipe({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Selectable(
          selectWordOnDoubleTap: true,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 165,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.IMAGE, arguments: recipe);
                    },
                    child: Hero(
                      tag: "${recipe.id}",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          recipe.image ?? "",
                          fit: BoxFit.cover,
                          width: 150,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset("./assets/images/error.png");
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const SizedBox(
                              width: 150,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 190,
                        child: Text(
                          recipe.title ?? "Error",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (recipe.cuisines!.isNotEmpty)
                        Row(children: [
                          SvgPicture.asset('./assets/images/bowl.svg',
                              height: 8,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(recipe.cuisines!.join(' | '))
                        ]),
                      const SizedBox(height: 5),
                      Row(children: [
                        const IgnoreSelectable(
                          child: Icon(
                            Icons.schedule,
                            size: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('${recipe.readyInMinutes} mins'),
                        const SizedBox(
                          width: 10,
                        ),
                        const IgnoreSelectable(
                          child: Icon(
                            Icons.pie_chart,
                            size: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('${recipe.servings} servings')
                      ])
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              initiallyExpanded: true,
              title: const Text("Ingredients"),
              children: [
                ...recipe.extendedIngredients!
                    .map((e) => Material(
                          child: InkWell(
                            splashColor: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Get.defaultDialog(
                                  titleStyle: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                  contentPadding: const EdgeInsets.all(20),
                                  radius: 10,
                                  title: e.name!.capitalizeFirst.toString(),
                                  content: Column(
                                    children: [
                                      Text('${e.original}'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                          width: 300,
                                          child: InteractiveViewer(
                                            child: Image.network(
                                              e.image!,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                    "./assets/images/error.png");
                                              },
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return const SizedBox(
                                                  width: 300,
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .background
                                                        .darken(50)
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .onBackground,
                                            width: 3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          e.image!,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                "./assets/images/error.png");
                                          },
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return const SizedBox(
                                              width: 50,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          },
                                        ),
                                      )),
                                  const SizedBox(width: 50),
                                  Expanded(
                                      child: Text("${e.name}",
                                          textAlign: TextAlign.start)),
                                  const Spacer(),
                                  Expanded(child: Text("${e.amount} ${e.unit}"))
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList()
              ],
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: const Text("Steps"),
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    if (recipe.analyzedInstructions!.isEmpty)
                      SizedBox(
                        width: 150,
                        child: MunchButton(
                            buttonType: MunchButtonType.filled,
                            onPressed: launchSourceURL,
                            child: const Text(
                              "View Here",
                              textAlign: TextAlign.center,
                            )),
                      )
                    else
                      ...recipe.analyzedInstructions!
                          .map((e) => Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ExpansionTile(
                                  initiallyExpanded: true,
                                  title: Text("Step ${e.number}"),
                                  children: [Text(e.step!)],
                                ),
                              ))
                          .toList(),
                  ]),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void launchSourceURL() async {
    if (await canLaunchUrl(Uri.parse(recipe.sourceUrl!))) {
      await launchUrl(
        Uri.parse(recipe.sourceUrl!),
        mode: LaunchMode.inAppWebView,
      ); //forceWebView is true now
    } else {
      if (await canLaunchUrl(Uri.parse(recipe.spoonacularSourceUrl!))) {
        await launchUrl(Uri.parse(recipe.spoonacularSourceUrl!),
            mode: LaunchMode.inAppWebView); //f
      }
    }
  }
}
