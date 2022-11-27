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

  Future getRecipes(int? dietID) async {
    var res = await get('/getRecipes/$dietID');
    print(res.body.runtimeType);
    if (res.status.hasError) {
      return Future.error(Exception(res.statusText));
    } else {
      return res.body.map((e) => Recipe.fromJson(e)).toList();
    }
  }
}
