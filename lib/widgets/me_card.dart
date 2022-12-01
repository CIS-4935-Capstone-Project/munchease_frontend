import 'package:flutter/material.dart';
import 'package:munchease/utils/theme_utils.dart';
import '../models/recipe_model.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                recipe.image!,
                fit: BoxFit.cover,
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
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.black87,
              ], begin: Alignment.center, end: Alignment.bottomCenter)),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft, //TODO center left
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(recipe.title!,
                        style: const TextStyle(
                            color: MunchColors.primaryLight,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700)),
                    const Padding(padding: EdgeInsets.only(bottom: 8.0)),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
