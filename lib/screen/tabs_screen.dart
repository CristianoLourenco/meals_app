import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favorites_provider.dart';
import 'package:meals_app/provider/filters_provider.dart';
import 'package:meals_app/screen/category_screen.dart';
import 'package:meals_app/screen/filters_screen.dart';
import 'package:meals_app/screen/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsSceen extends ConsumerStatefulWidget {
  const TabsSceen({super.key});

  @override
  ConsumerState<TabsSceen> createState() => _TabsSceenState();
}

class _TabsSceenState extends ConsumerState<TabsSceen> {
  int _slectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(fiterMealsProvider);

    String activePageTitle = 'Category';
    Widget activePage = CategoryScreen(availableMeals: availableMeals);
    _controlIndexChange(activePage, activePageTitle);

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelected: _setScreen),
      body: activePage,
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

  void _controlIndexChange(Widget activePage, String activePageTitle) {
    if (_slectedPageIndex == 1) {
      final favoritMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(mealList: favoritMeals);
      activePageTitle = 'Your Favorites';
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
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );
    }
  }
}
