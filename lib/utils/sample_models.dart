import '../models/recipe_model.dart';

var sample = {
  "extendedIngredients": [
    {
      "id": 11090,
      "image": "broccoli.jpg",
      "name": "broccoli",
      "original": "2 cups cooked broccoli, chopped small",
      "amount": 2,
      "unit": "cups"
    }
  ],
  "id": 716426,
  "title": "Cauliflower, Brown Rice, and Vegetable Fried Rice",
  "readyInMinutes": 30,
  "servings": 8,
  "sourceUrl":
      "http://fullbellysisters.blogspot.com/2012/01/cauliflower-fried-rice-more-veggies.html",
  "image": "https://spoonacular.com/recipeImages/716426-312x231.jpg",
  "summary":
      "Cauliflower, Brown Rice, and Vegetable Fried Rice might be a good recipe to expand your side dish recipe box. Watching your figure? This gluten free, dairy free, lacto ovo vegetarian, and vegan recipe has <b>192 calories</b>, <b>7g of protein</b>, and <b>6g of fat</b> per serving. For <b>\$1.12 per serving</b>, this recipe <b>covers 19%</b> of your daily requirements of vitamins and minerals. This recipe serves 8. This recipe from fullbellysisters.blogspot.com has 3689 fans. This recipe is typical of Chinese cuisine. From preparation to the plate, this recipe takes about <b>30 minutes</b>. Head to the store and pick up peas, broccoli, salt, and a few other things to make it today. Overall, this recipe earns an <b>awesome spoonacular score of 100%</b>. Users who liked this recipe also liked <a href=\"https://spoonacular.com/recipes/vegetable-fried-brown-rice-36199\">Vegetable Fried Brown Rice</a>, <a href=\"https://spoonacular.com/recipes/vegetable-fried-cauliflower-rice-933261\">Vegetable Fried Cauliflower Rice</a>, and <a href=\"https://spoonacular.com/recipes/easy-vegetable-fried-brown-rice-with-egg-802042\">Easy Vegetable Fried Brown Rice with Egg</a>.",
  "cuisines": ["Chinese", "Asian"],
  "diets": ["gluten free", "dairy free", "lacto ovo vegetarian", "vegan"],
  "analyzedInstructions": [
    {
      "steps": [
        {
          "number": 1,
          "step":
              "Remove the cauliflower's tough stem and reserve for another use. Using a food processor, pulse cauliflower florets until they resemble rice or couscous. You should end up with around four cups of \"cauliflower rice.\""
        }
      ]
    }
  ],
  "spoonacularSourceUrl":
      "https://spoonacular.com/cauliflower-brown-rice-and-vegetable-fried-rice-716426"
};

var recipeModelSample = [
  Recipe.fromJson(sample),
  Recipe.fromJson(sample),
  Recipe.fromJson(sample)
];