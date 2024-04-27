import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/controller/provider/favorites_provider.dart';
import 'package:meals_app/controller/provider/filters_provider.dart';
import 'package:meals_app/view/screen/category_screen.dart';
import 'package:meals_app/view/screen/filters_screen.dart';
import 'package:meals_app/view/screen/meals_screen.dart';
import 'package:meals_app/view/widgets/main_drawer.dart';

class TabsSceen extends ConsumerStatefulWidget {
  const TabsSceen({super.key});

  @override
  ConsumerState<TabsSceen> createState() => _TabsSceenState();
}

class _TabsSceenState extends ConsumerState<TabsSceen> {
  late int _selectedPageIndex;
  late String activePageTitle;

  @override
  void initState() {
    _selectedPageIndex = 0;
    activePageTitle = "Categories";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const String category = "Categories";
    const String favorites = "Favorites";
    Widget activePage = _controlIndexChange();

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelected: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: category,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: favorites,
          )
        ],
      ),
    );
  }

  Widget _controlIndexChange() {
    final availableMeals = ref.watch(fiterMealsProvider);

    if (_selectedPageIndex == 1) {
      final favoritMeals = ref.watch(favoriteMealsProvider);
      activePageTitle = "Your Favorites";
      return MealsScreen(mealList: favoritMeals);
    }
    activePageTitle = "Categories";
    return CategoryScreen(availableMeals: availableMeals);
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
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
