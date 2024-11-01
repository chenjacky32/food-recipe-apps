import 'package:flutter/material.dart';
import 'package:food_recipe_apps/model/FoodRecipes.dart';
import 'package:food_recipe_apps/utils/FavoriteManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipesDetails extends StatelessWidget {
  final FoodRecipes recipes;
  final VoidCallback onFavoriteUpdated;

  const RecipesDetails(
      {Key? key, required this.recipes, required this.onFavoriteUpdated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  child: Image.asset(
                    recipes.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 450.0,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0XFF042628),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        FavoriteButton(
                            recipes: recipes,
                            onFavoriteUpdated: onFavoriteUpdated),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          recipes.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${recipes.ingredients.length} Ingredients',
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Color(0XFF748189),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _InfoIcon(Icons.timer, '${recipes.cookTime} min'),
                            _InfoIcon(Icons.local_fire_department,
                                '${recipes.calories} Kcal'),
                            _InfoIcon(
                                Icons.restaurant, '${recipes.servings} serve'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF0A2533),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: recipes.ingredients.map((ingredient) {
                      return Chip(
                        backgroundColor: Color(0XFFE6EBF2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        label: Text(
                          '${ingredient["name"]} (${ingredient["amount"]})',
                          style: const TextStyle(color: Color(0XFF0A2533)),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Cooking Instructions',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF0A2533),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipes.steps.asMap().entries.map((entry) {
                      int index = entry.key + 1;
                      String step = entry.value;
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Color(0XFFF1F5F5),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade900,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Step $index: ',
                              style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF0A2533)),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              step,
                              style: const TextStyle(
                                  fontSize: 16.0, color: Color(0XFF0A2533)),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoIcon(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Color(0XFF042628)),
        const SizedBox(height: 4.0),
        Text(text, style: const TextStyle(fontSize: 16.0)),
      ],
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final FoodRecipes recipes;
  final VoidCallback onFavoriteUpdated;

  const FavoriteButton(
      {Key? key, required this.recipes, required this.onFavoriteUpdated})
      : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = prefs.getBool(widget.recipes.id) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
          FavoritesManager().toggleFavorite(widget.recipes).then((_) {
            widget.onFavoriteUpdated();
          });
        });
  }
}
