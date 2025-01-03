import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_menu_recipe/models/meal_model.dart';
class FavouriteMealsNotifier extends StateNotifier<List<MealModel>>{
  FavouriteMealsNotifier() : super([]);

  bool toggleFavoriteMealsState(MealModel mealModel) {
    if(state.contains(mealModel)) {  // means already present
      state = state.where((m) => m.id != mealModel.id).toList();
      return false;
    } else {
      state = [...state, mealModel]; // add
      return true;
    }
  }
}

final favoriteMeals = StateNotifierProvider<FavouriteMealsNotifier, List<MealModel>>((ref) {
  return FavouriteMealsNotifier();
});