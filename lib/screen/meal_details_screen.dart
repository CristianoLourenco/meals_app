import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/provider/favorites_provider.dart';
import 'package:meals_app/widgets/favorite_icon_btn.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends ConsumerWidget {
  final MealModel mealModel;

  const MealDetailsScreen({
    super.key,
    required this.mealModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isFavorite =
        ref.watch(favoriteMealsProvider).contains(mealModel);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealModel.title),
        actions: [
          FavoriteIconButtonWidget(
            mealModel: mealModel,
            isFavorite: isFavorite,
            onPressed: () => _onFavoritePressed(context, ref),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: mealModel.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(mealModel.imageUrl),
                width: double.maxFinite,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            for (final ingredient in mealModel.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            for (final ingredient in mealModel.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(
                  ingredient,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _onFavoritePressed(BuildContext context, WidgetRef ref) {
    const String addedText = "Meal added as a favorite!";
    const String removedText = "Meal removed from favorites!";
    final wasAdded =
        ref.read(favoriteMealsProvider.notifier).toogleFavoriteMeal(mealModel);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        content: Text(wasAdded ? addedText : removedText),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
