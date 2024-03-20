import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meal_model.dart';

class FavoriteMealsNotifier extends StateNotifier<List<MealModel>> {
  FavoriteMealsNotifier() : super([]);

  bool toogleFavoriteMeal(MealModel meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      //! spread operator '...' -> get all items inside a list
      state = [...state, meal];
       return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<MealModel>>(
  (ref) => FavoriteMealsNotifier(),
);
