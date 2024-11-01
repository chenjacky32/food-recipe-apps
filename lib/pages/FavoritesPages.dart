import 'package:flutter/material.dart';
import 'package:food_recipe_apps/model/FoodRecipes.dart';
import 'package:food_recipe_apps/pages/RecipesDetails.dart';
import 'package:food_recipe_apps/utils/FavoriteManager.dart';
import 'package:food_recipe_apps/utils/FavoritesUtils.dart';

class FavoritesPages extends StatefulWidget {
  const FavoritesPages({Key? key}) : super(key: key);

  @override
  _FavoritesPagesState createState() => _FavoritesPagesState();
}

class _FavoritesPagesState extends State<FavoritesPages> {
  List<FoodRecipes> favoriteRecipes = [];

  Future<void> _loadFavoriteRecipes() async {
    final recipes = await loadFavoriteRecipes();
    setState(() {
      favoriteRecipes = recipes;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFavoriteRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color(0XFF042628),
      ),
      body: SafeArea(
        child: ValueListenableBuilder<List<FoodRecipes>>(
          valueListenable: FavoritesManager().favoritesNotifier,
          builder: (context, favoriteRecipes, child) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: favoriteRecipes.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada favorit!',
                        style:
                            TextStyle(fontSize: 18.0, color: Color(0XFF748189)),
                      ),
                    )
                  : ListView.builder(
                      itemCount: favoriteRecipes.length,
                      itemBuilder: (context, index) {
                        final recipe = favoriteRecipes[index];
                        return _buildFavoriteCard(context, recipe);
                      },
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, FoodRecipes recipe) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            recipe.imagePath,
            fit: BoxFit.cover,
            width: 60.0,
            height: 60.0,
          ),
        ),
        title: Text(
          recipe.title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0XFF0A2533),
          ),
        ),
        subtitle: Text(
          '${recipe.cookTime} mins | ${recipe.calories} kcal',
          style: const TextStyle(
            color: Color(0XFF748189),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios, color: Color(0XFF70B9BE)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipesDetails(
                  recipes: recipe,
                  onFavoriteUpdated: () async {
                    final favorites = await loadFavoriteRecipes();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
