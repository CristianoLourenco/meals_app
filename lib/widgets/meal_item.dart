import 'package:flutter/material.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget({super.key, required this.model});

  final MealModel model;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(model.imageUrl),
            )
          ],
        ),
      ),
    );
  }
}
