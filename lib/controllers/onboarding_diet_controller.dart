import 'package:get/get.dart';
import 'package:munchease/utils/app_boxes.dart';

class OnboardingDietController extends GetxController with DietBox {
  var cuisine = Get.arguments;
  var diets = [
    "None",
    "Lacto-Ovo-Vegetarian",
    "Ketogenic",
    "Gluten Free",
    "Vegetarian",
    "Vegan",
    "Pescetarian",
    "Paleo",
    "Primal",
    "Low FODMAP",
    "Whole30"
  ]; // diets from spoonacular
  late RxInt _selectedIndex;
  get selectedIndex => _selectedIndex.value; //getter
  set selectedIndex(value) => _selectedIndex.value = value; //sett

  @override
  void onInit() {
    super.onInit();
    _selectedIndex = RxInt(getDiet() ?? 0);
  }

  changeIndex(value) {
    selectedIndex = value;
    _setDiet(value);
  }

  _setDiet(value) async {
    await putDiet(value);
  }
}
