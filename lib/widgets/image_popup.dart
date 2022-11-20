import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/models/recipe_model.dart';

class ImagePopup extends StatelessWidget {
  final Recipe recipe = Get.arguments;
  ImagePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Hero(
              tag: "${recipe.id}",
              child: InteractiveViewer(
                child: Image.network(
                  recipe.image ?? "https://dummyimage.com/640x360/fff/aaa",
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
              )),
        ),
      ),
    );
  }
}
