import 'package:food_recipe_apps/model/FoodRecipes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<FoodRecipes>> loadFavoriteRecipes() async {
  final prefs = await SharedPreferences.getInstance();
  final favoriteIds = prefs.getKeys();
  return FoodRecipesList.where((recipe) => favoriteIds.contains(recipe.id))
      .toList();
}
