import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/category_model.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/screen/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _selectCategory(BuildContext context, CategoryModel model) {
    final mealsList = dummyMealModels
        .where(
          (meal) => meal.categories.contains(model.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: model.title,
          mealList: mealsList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick the category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: <Widget>[
          for (final categoryModel in availableCategories)
            CategoryGridItem(
              categoryModel: categoryModel,
              onSelectCategory: () {
                _selectCategory(context, categoryModel);
              },
            )
        ],
      ),
    );
  }
}
