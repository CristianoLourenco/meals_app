import 'package:flutter/material.dart';
import 'package:meals_app/screen/category_screen.dart';
import 'package:meals_app/screen/meals_screen.dart';

class TabsSceen extends StatefulWidget {
  const TabsSceen({super.key});

  @override
  State<TabsSceen> createState() => _TabsSceenState();
}

class _TabsSceenState extends State<TabsSceen> {
  int _slectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _slectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Object activePage = const CategoryScreen();
    String activePageTitle = 'Categoties';

    if (_slectedPageIndex == 1) {
      activePage = const MealsScreen(title: 'Favorites', mealList: []);
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _slectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
