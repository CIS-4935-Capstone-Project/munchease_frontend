import 'package:get/get.dart';
import 'package:munchease/utils/server_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/recipe_model.dart';

class FinalRecipeScreenController extends GetxController
    with StateMixin<Recipe> {
  Server server = Get.find();

  FinalRecipeScreenController({required Recipe recipe}) {
    change(recipe);
  }

  @override
  void onInit() {
    super.onInit();
    handleLoading();
  }

  handleLoading() async {
    if (state!.spoonacularSourceUrl != null) {
      change(state, status: RxStatus.success());
    } else {
      change(state, status: RxStatus.loading());
      var serverRecipe = await server.getRecipeFromId(state!.id);
      change(serverRecipe, status: RxStatus.success());
    }
  }

  launchMapURL() async {
    Uri googleUri = Uri.parse("https://google.com/maps/search/${state!.title}");
    if (await canLaunchUrl(googleUri)) {
      await launchUrl(googleUri,
          mode: LaunchMode.inAppWebView); //forceWebView is true now
    } else {
      throw 'Could not launch $googleUri")}';
    }
  }
}
