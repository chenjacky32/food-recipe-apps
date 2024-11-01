import 'package:flutter/material.dart';
import 'package:food_recipe_apps/model/FoodRecipes.dart';
import 'package:food_recipe_apps/pages/RecipesDetails.dart';
import 'package:food_recipe_apps/utils/FavoritesUtils.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final Map<String, bool> _selectedCategories = {
    'Appitizers': false,
    'Main Course': false,
    'Desserts': false,
    'Side Dish': false,
    'Salads': false,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF042628),
        title: const Text('Food Recipes Apps',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        // backgroundColor: Colors.green,
        actions: [
          IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              iconSize: 40.0,
              onPressed: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF042628),
                  width: 1.2,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 3.0),
                padding: const EdgeInsets.all(20.0),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    labelText: 'Search',
                    hintText: 'Search Food',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              //Category
              Container(
                margin: const EdgeInsets.only(top: 10.0, left: 20.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Category',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF0A2533)),
                    ),
                  ],
                ),
              ),
              Container(
                height: 80.0,
                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _selectedCategories.keys.map((category) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: FilterChip(
                        label: Text(category,
                            style: TextStyle(
                              color: _selectedCategories[category]!
                                  ? Colors.white
                                  : Color(0XFF0A2533),
                            )),
                        selected: _selectedCategories[category]!,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedCategories[category] = selected;
                          });
                        },
                        selectedColor: Color(0XFF70B9BE),
                        backgroundColor: Colors.grey.shade200.withOpacity(0.9),
                        checkmarkColor: Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
              //Category

              Container(
                margin: const EdgeInsets.only(top: 10.0, left: 20.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Recommended',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF0A2533)),
                    ),
                  ],
                ),
              ),
              Container(
                height: 420.0,
                padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: FoodRecipesList.map(
                      (recipe) => _buildRecipeCard(context, recipe)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildRecipeCard(BuildContext context, FoodRecipes recipe) {
  return InkWell(
    onTap: () {
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
    child: Container(
      width: 220.0,
      margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  recipe.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            recipe.title,
            style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Color(0XFF0A2533)),
            textAlign: TextAlign.center,
          ),
          Text(
            '${recipe.ingredients.length} ingredients',
            style: const TextStyle(fontSize: 12.0, color: Color(0XFF748189)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
