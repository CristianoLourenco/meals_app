import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/controller/data/data_controller.dart';

final mealsProvider = Provider((ref) => MealsDataController().getMeals());
