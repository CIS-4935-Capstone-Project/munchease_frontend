import 'package:get/get.dart';

class OnboardingDietController extends GetxController {
  List<String> diets = [
    "None",
    "Gluten Free",
    "Ketogenic",
    "Vegetarian",
    "Lacto-Ovo-Vegetarian",
    "Vegan",
    "Pescetarian",
    "Paleo",
    "Primal",
    "Low FODMAP",
    "Whole30"
  ];

  final _groupValue = "None".obs;
  get groupValue => _groupValue.value;
  set groupValue(value) => _groupValue.value = value;

  selectDiet(diet) {
    groupValue = diet;
  }
}
