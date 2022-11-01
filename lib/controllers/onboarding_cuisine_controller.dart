import 'package:get/get.dart';
import 'package:munchease/utils/app_boxes.dart';

class OnboardingCuisineController extends GetxController with CuisineBox {
  final availableCuisines = [
    "European",
    "French",
    "German",
    "Greek",
    "Indian",
    "Chinese",
    "Italian",
    "Japanese",
    "African",
    "American",
    "British",
    "Cajun",
    "Korean",
    "Thai",
    "Nordic",
    "Caribbean",
    "Irish",
    "Mediterranean",
    "Middle Eastern",
    "Latin American",
    "Spanish",
    "Jewish",
    "Eastern European",
    "Vietnamese",
    "Mexican",
    "Southern",
  ];

  late RxList<String> selectedCuisines;

  @override
  void onInit() {
    super.onInit();
    selectedCuisines = RxList(getCuisine() ?? List<String>.empty());
  }

  void handleMunchchip(
      {bool isSelected = false, required String cuisine}) async {
    isSelected
        ? selectedCuisines.add(cuisine)
        : selectedCuisines.remove(cuisine);

    await putCuisine(selectedCuisines);
  }
}
