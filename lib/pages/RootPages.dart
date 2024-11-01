import 'package:flutter/material.dart';
import 'package:food_recipe_apps/pages/CategoriesPages.dart';
import 'package:food_recipe_apps/pages/FavoritesPages.dart';
import 'package:food_recipe_apps/pages/HomePages.dart';
import 'package:food_recipe_apps/pages/ProfilePages.dart';

class RootPages extends StatefulWidget {
  const RootPages({Key? key}) : super(key: key);

  @override
  State<RootPages> createState() => _RootPagesState();
}

class _RootPagesState extends State<RootPages> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePages(),
    const FavoritesPages(),
    const CategoriesPages(),
    const ProfilePages(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color(0XFF042628),
        unselectedItemColor: Color(0XFF70B9BE),
      ),
    );
  }
}
