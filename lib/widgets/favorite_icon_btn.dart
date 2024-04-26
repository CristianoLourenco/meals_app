import 'package:flutter/material.dart'; 
import 'package:meals_app/model/meal_model.dart'; 

class FavoriteIconButtonWidget extends StatelessWidget {
  const FavoriteIconButtonWidget({
    super.key,
    required this.mealModel,
    required this.isFavorite,
    this.onPressed,
  });

  final MealModel mealModel;
  final bool isFavorite;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return SizeTransition(
            sizeFactor: Tween<double>(begin: 0.1, end: 1).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeIn,
              ),
            ),
            child: child,
          );
        },
        child: Icon(
          isFavorite ? Icons.star : Icons.star_border,
          key: ValueKey(isFavorite),
        ),
      ),
    );
  }
}
