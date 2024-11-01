import 'package:flutter/material.dart';
import 'package:food_recipe_apps/pages/RootPages.dart';
import 'package:food_recipe_apps/utils/FavoriteManager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FavoritesManager().loadFavorites();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipe Apps',
      theme: ThemeData(),
      home: const RootPages(),
    );
  }
}
