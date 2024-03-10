import 'package:flutter/material.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/screen/category_screen.dart';
import 'package:meals_app/screen/meals_screen.dart';

class TabsSceen extends StatefulWidget {
  const TabsSceen({super.key});

  @override
  State<TabsSceen> createState() => _TabsSceenState();
}

class _TabsSceenState extends State<TabsSceen> {
  int _slectedPageIndex = 0;
  final _favoritMeals = <MealModel>[];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavoritStatus(MealModel model) {
    final isExisting = _favoritMeals.contains(model);
    if (isExisting) {
      setState(() {
        _favoritMeals.remove(model);
      });
      _showInfoMessage('${model.title} removed from favorites');
    } else {
      setState(() {
        _favoritMeals.add(model);
      });
      _showInfoMessage('${model.title} added to favorites');
    }
  }

  void _selectedPage(int index) {
    setState(() {
      _slectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Object activePage = CategoryScreen(
      onToggleFavorite: _toggleMealFavoritStatus,
    );
    String activePageTitle = 'Categoties';

    if (_slectedPageIndex == 1) {
      activePage = MealsScreen(
        mealList: _favoritMeals,
        onToggleFavorite: _toggleMealFavoritStatus,
      );
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
