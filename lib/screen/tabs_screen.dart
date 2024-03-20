import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/enum/enum_file.dart'; 
import 'package:meals_app/provider/favorites_provider.dart';
import 'package:meals_app/screen/category_screen.dart';
import 'package:meals_app/screen/filters_screen.dart';
import 'package:meals_app/screen/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/provider/meals_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsSceen extends ConsumerStatefulWidget {
  const TabsSceen({super.key});

  @override
  ConsumerState<TabsSceen> createState() => _TabsSceenState();
}

class _TabsSceenState extends ConsumerState<TabsSceen> {
  int _slectedPageIndex = 0; 
  Map<Filter, bool> _selectedFilters = kInitialFilters;
 

  /* We manage this on provider now
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
*/
 
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
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
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
      availableMeals: availableMeals,
    );
    String activePageTitle = 'Categoties';

    if (_slectedPageIndex == 1) {
      final favoritMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        mealList: favoritMeals, 
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
