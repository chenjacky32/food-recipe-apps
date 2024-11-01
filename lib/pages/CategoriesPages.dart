import 'package:flutter/material.dart';

class CategoriesPages extends StatelessWidget {
  final List<Category> categories = const [
    Category(name: 'Appetizers', icon: Icons.restaurant_menu),
    Category(name: 'Main Course', icon: Icons.dinner_dining),
    Category(name: 'Dessert', icon: Icons.cake),
    Category(name: 'Side Dish', icon: Icons.local_dining),
    Category(name: 'Salads', icon: Icons.emoji_food_beverage),
  ];

  const CategoriesPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color(0XFF042628),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return _buildCategoryCard(context, category);
          },
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, Category category) {
    return GestureDetector(
      onTap: () {
        // Navigate to a specific category recipe list
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryRecipesPage(category: category),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Color(0XFF70B9BE),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              size: 50.0,
              color: Color(0XFF042628),
            ),
            const SizedBox(height: 10),
            Text(
              category.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;

  const Category({required this.name, required this.icon});
}

class CategoryRecipesPage extends StatelessWidget {
  final Category category;

  const CategoryRecipesPage({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${category.name} Recipes',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color(0XFF042628),
      ),
      body: Center(
        child: Text(
          'List of ${category.name} recipes goes here.',
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
