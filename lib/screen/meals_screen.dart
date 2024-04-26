import 'package:flutter/material.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/screen/meals_screen_content.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title = '',
    required this.mealList,
  });

  final String title;
  final List<MealModel> mealList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: MealsScreenContent(mealList: mealList),
    );
  }
}
