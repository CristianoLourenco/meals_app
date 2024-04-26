import 'package:flutter/material.dart';

class MealIemTrait extends StatelessWidget {
  const MealIemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
            icon,
            size: 17,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
