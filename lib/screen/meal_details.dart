import 'package:flutter/material.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealModel.title),
      ),
      body: Column(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(mealModel.imageUrl),
            width: double.maxFinite,
            height: 300,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
