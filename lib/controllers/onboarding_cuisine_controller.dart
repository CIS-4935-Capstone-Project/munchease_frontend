import 'package:get/get.dart';

class OnboardingCuisineController extends GetxController {
  final availableCuisines = [
    "African",
    "American",
    "British",
    "Cajun",
    "Caribbean",
    "Chinese",
    "Eastern European",
    "European",
    "French",
    "German",
    "Greek",
    "Indian",
    "Irish",
    "Italian",
    "Japanese",
    "Jewish",
    "Korean",
    "Latin American",
    "Mediterranean",
    "Mexican",
    "Middle Eastern",
    "Nordic",
    "Southern",
    "Spanish",
    "Thai",
    "Vietnamese"
  ];

  List<String> selectedCuisines = [];

  void handleMunchchip({bool isSelected = false, required String cuisine}) {
    // TODO: connect to hive
    isSelected
        ? selectedCuisines.add(cuisine)
        : selectedCuisines.remove(cuisine);
    print(selectedCuisines);
  }
}
