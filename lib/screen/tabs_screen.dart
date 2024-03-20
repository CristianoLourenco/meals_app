import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/data/enum/enum_file.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/screen/category_screen.dart';
import 'package:meals_app/screen/filters_screen.dart';
import 'package:meals_app/screen/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsSceen extends StatefulWidget {
  const TabsSceen({super.key});

  @override
  State<TabsSceen> createState() => _TabsSceenState();
}

class _TabsSceenState extends State<TabsSceen> {
  int _slectedPageIndex = 0;
  final _favoritMeals = <MealModel>[];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

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

  void _setScreen(String identifier) async {
    // do it a single time
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      // getting information back using navigator
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
    /*we need to close the drawer 
    else {
      Navigator.of(context).pop();
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMealModels.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Object activePage = CategoryScreen(
      onToggleFavorite: _toggleMealFavoritStatus,
      availableMeals: availableMeals,
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
      drawer: MainDrawer(onSelected: _setScreen),
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
