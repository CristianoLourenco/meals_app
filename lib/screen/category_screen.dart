import 'package:flutter/material.dart';
import 'package:meals_app/data/available_categorties.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CatgoryScreen extends StatelessWidget {
  const CatgoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick the category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: <Widget>[
          for (final categoryModel in availableCategories)
            CategoryGridItem(categoryModel: categoryModel)
        ],
      ),
    );
  }
}
