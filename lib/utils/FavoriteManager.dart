import 'package:flutter/foundation.dart';
import 'package:food_recipe_apps/model/FoodRecipes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesManager {
  static final FavoritesManager _instance = FavoritesManager._internal();
  factory FavoritesManager() => _instance;
  FavoritesManager._internal();

  final ValueNotifier<List<FoodRecipes>> favoritesNotifier = ValueNotifier([]);

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = prefs.getKeys();
    favoritesNotifier.value =
        FoodRecipesList.where((recipe) => favoriteIds.contains(recipe.id))
            .toList();
  }

  Future<void> toggleFavorite(FoodRecipes recipe) async {
    final prefs = await SharedPreferences.getInstance();
    final isFavorite = prefs.getBool(recipe.id) ?? false;

    if (isFavorite) {
      prefs.remove(recipe.id);
    } else {
      prefs.setBool(recipe.id, true);
    }

    loadFavorites();
  }
}
