import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_menu_recipe/data/dummy_meals_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMealData;
});