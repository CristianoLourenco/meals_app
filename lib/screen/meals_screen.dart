import 'package:flutter/material.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/screen/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
      this.title,
    required this.mealList,
  });

  final String? title;
  final List<MealModel> mealList;

  void onSelectMeal(BuildContext context, MealModel model) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(mealModel: model),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: theme.textTheme.headlineLarge!.copyWith(
              color: theme.colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onBackground,
            ),
          )
        ],
      ),
    );

    if (mealList.isNotEmpty) {
      content = ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, index) {
          return MealItemWidget(
            model: mealList[index],
            onSelectMeal: (model) => onSelectMeal(context, model),
          );
        },
      );
    }

    if (title == null) {
      
    return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
