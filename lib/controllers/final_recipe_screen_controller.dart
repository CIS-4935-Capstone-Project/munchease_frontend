import 'package:get/get.dart';
import 'package:munchease/utils/server_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/recipe_model.dart';

class FinalRecipeScreenController extends GetxController
    with StateMixin<Recipe> {
  Server server;

  FinalRecipeScreenController({required Recipe recipe, required this.server}) {
    change(recipe);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    handleLoading();
  }

  handleLoading() async {
    if (state!.spoonacularSourceUrl != null) {
      change(state, status: RxStatus.success());
    } else {
      change(state, status: RxStatus.loading());
      // TODO: try catch get recipe from server using the id
      var serverRecipe = await server.getRecipeFromId(state!.id);

      change(serverRecipe, status: RxStatus.success());
    }
  }

  launchMapURL() async {
    if (await canLaunchUrl(
        Uri.parse("https://google.com/maps/search/${state!.title}"))) {
      await launchUrl(
          Uri.parse("https://google.com/maps/search/${state!.title}"),
          mode: LaunchMode.inAppWebView); //forceWebView is true now
    } else {
      throw 'Could not launch ${Uri.parse("https://google.com/maps/search/${state!.title}")}';
    }
  }
}
