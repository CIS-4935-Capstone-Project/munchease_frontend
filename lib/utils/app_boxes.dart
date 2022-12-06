// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

mixin DietBox {
  final _boxDietName = "user_diet";

  int? getDiet() {
    return MunchBox.prefRepo.get(_boxDietName);
  }

  Future putDiet(int value) async {
    return MunchBox.prefRepo.put(_boxDietName, value);
  }
}

mixin UserToken {
  final _boxUserToken = "user_token";

  Map? getToken() {
    return MunchBox.prefRepo.get(_boxUserToken);
  }

  Future putToken(Map userInfo) async {
    return MunchBox.prefRepo.put(_boxUserToken, userInfo);
  }
}

mixin RememberUser {
  final _boxName = "remember_user";

  Map? getUser() {
    return MunchBox.prefRepo.get(_boxName);
  }

  Future putUser(Map userInfo) async {
    return MunchBox.prefRepo.put(_boxName, userInfo);
  }
}

mixin CuisineBox {
  final _boxCuisineName = "user_cuisine";

  List<String>? getCuisine() {
    return MunchBox.prefRepo.get(_boxCuisineName);
  }

  Future putCuisine(List<String> value) async {
    return MunchBox.prefRepo.put(_boxCuisineName, value);
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

mixin ThemeBox {
  final _themeBoxName = "user_theme";

  String? getTheme() {
    return MunchBox.prefRepo.get(_themeBoxName);
  }

  Future putTheme(theme) {
    return MunchBox.prefRepo.put(_themeBoxName, theme);
  }
}

class MunchBox {
  static const _USR_PRF = 'user_prefs';
  static const _USR_FAV = 'user_favorites';
  static const _USR_INFO = 'remember_user';
  Box? _userPrefs;
  Box? _userFavorites;
  Box? _userInfo;
  Future openBoxes() async {
    _userPrefs = await Hive.openBox(_USR_PRF);
    _userFavorites = await Hive.openBox(_USR_FAV);
  }

  Future<bool> boxExists() async {
    bool x = await Hive.boxExists(_USR_PRF);
    bool j = await Hive.boxExists(_USR_FAV);
    return x & j;
  }

  Future deleteBoxes() async {
    await Hive.box("user_prefs").deleteFromDisk();
    await Hive.box("user_favorites").deleteFromDisk();
  }

  ThemeMode getUserTheme() {
    String? t = prefRepo.get('user_theme');
    if (t == null) {
      return ThemeMode.system;
    } else if (t == 'light') {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
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
