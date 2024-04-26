import 'package:flutter/material.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/screen/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreenContent extends StatelessWidget {
  const MealsScreenContent({
    super.key, 
    required this.mealList,
  });
 
  final List<MealModel> mealList;

  @override
  Widget build(BuildContext context) {
    return defineContent(context);
  }

  Widget defineContent(BuildContext context) {
    final theme = Theme.of(context);
    if (mealList.isEmpty) {
      return Center(
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
    }
    return ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, index) {
          return MealItemWidget(
            model: mealList[index],
            onSelectMeal: (model) => onSelectMeal(context, model),
          );
        },
      );
  }

  void onSelectMeal(BuildContext context, MealModel model) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(mealModel: model),
      ),
    );
  }
}
