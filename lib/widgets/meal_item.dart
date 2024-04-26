import 'package:flutter/material.dart';
import 'package:meals_app/model/meal_model.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget({
    super.key,
    required this.model,
    required this.onSelectMeal,
  });

  final MealModel model;
  final void Function(MealModel model) onSelectMeal;

  String get complexityText {
    return model.complexity.name[0].toUpperCase() +
        model.complexity.name.substring(1);
  }

  String get affordabilityText {
    return model.affordability.name[0].toUpperCase() +
        model.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => onSelectMeal(model),
        child: Stack(
          children: [
            Hero(
              tag: model.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(model.imageUrl),
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: 200,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      model.title,
                      maxLines: 2,
                      softWrap: true,
                      textAlign: TextAlign.center, //! very long text: ...
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MealIemTrait(
                            icon: Icons.schedule,
                            label: "${model.duration} min",
                          ),
                          MealIemTrait(
                            icon: Icons.work,
                            label: "$complexityText min",
                          ),
                          MealIemTrait(
                            icon: Icons.attach_money,
                            label: affordabilityText,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
