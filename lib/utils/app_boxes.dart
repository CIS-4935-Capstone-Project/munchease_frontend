import 'package:hive/hive.dart';

mixin DietBox {
  final _boxName = "user_diet";

  int? getDiet() {
    return MunchBox.prefRepo.get(_boxName);
  }

  Future putDiet(int value) async {
    return MunchBox.prefRepo.put(_boxName, value);
  }
}

mixin CuisineBox {
  final _boxName = "user_cuisine";

  List<String>? getCuisine() {
    return MunchBox.prefRepo.get(_boxName);
  }

  Future putCuisine(List<String> value) async {
    return MunchBox.prefRepo.put(_boxName, value);
  }
}

abstract class MunchBox {
  static const _USR_PRF = 'user_prefs';

  static openBoxes() async {
    await Hive.openBox(_USR_PRF);
  }

  static var prefRepo = Hive.box(_USR_PRF);
// TODO: login box
}
