// ignore_for_file: constant_identifier_names

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

mixin RememberUser {
  final _boxName = "remember_user";

  Map<String, String>? getUser() {
    return MunchBox.prefRepo.get(_boxName);
  }

  Future putUser(Map<String, String> userInfo) async {
    return MunchBox.prefRepo.put(_boxName, userInfo);
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

mixin FavoriteBox {
  final _boxName = "user_favorites";

  List? getFavorites() {
    return MunchBox.favRepo.get(_boxName);
  }

  Future putFavorites(value) {
    return MunchBox.favRepo.put(_boxName, [...getFavorites() ?? [], value]);
  }
}

class MunchBox {
  static const _USR_PRF = 'user_prefs';
  static const _USR_FAV = 'user_favorites';
  Box? _userPrefs;
  Box? _userFavorites;
  Future openBoxes() async {
    _userPrefs = await Hive.openBox(_USR_PRF);
    _userFavorites = await Hive.openBox(_USR_FAV);
  }

  Future deleteBoxes() async {
    _userPrefs?.deleteFromDisk();
    _userFavorites?.deleteFromDisk();
  }

  static Box prefRepo = Hive.box(_USR_PRF);
  static Box favRepo = Hive.box(_USR_FAV);
// TODO: login box
}

class TestDiet with DietBox {
  Future testPut(value) {
    return putDiet(value);
  }
}

class TestCuisine with CuisineBox {
  Future testPut(value) {
    return putCuisine(value);
  }
}
