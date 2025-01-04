import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_menu_recipe/provider/meals_provider.dart';
enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}
class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier () : super({
    Filters.glutenFree : false,
    Filters.lactoseFree : false,
    Filters.vegetarian : false,
    Filters.vegan : false,
  });

  void setFilter(Filters filters, bool isActive) {
    state = {
      ...state,
      filters: isActive,
    };
  }
  void setFilters(Map<Filters, bool> allFilters) {
    state = allFilters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
  (ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final recentFilters = ref.watch(filtersProvider);
  return meals.where((meals) {
      if(recentFilters[Filters.glutenFree]! && !meals.isGlutenFree) { // means one is true and another one is not true
        return false;
      }
      if(recentFilters[Filters.lactoseFree]! && !meals.isLactoseFree) {
        return false;
      }
      if(recentFilters[Filters.vegetarian]! && !meals.isVegetarian) {
        return false;
      }
      if(recentFilters[Filters.vegan]! && !meals.isVegan) {
        return false;
      }
      return true; // otherwise others will be return true and include to availableMeals
    }).toList();
});