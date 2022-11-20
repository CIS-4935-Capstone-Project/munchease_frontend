import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:munchease/models/recipe_model.dart';

class Server extends GetConnect {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    httpClient.baseUrl = "https://munchease.deta.dev";
  }

  Future<Recipe> getRecipeFromId(id) async {
    var res = await get('/recipeFromId/$id');
    print(res.body.runtimeType);
    return Recipe.fromJson(res.body.first);
  }
}
