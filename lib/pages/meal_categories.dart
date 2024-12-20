import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/data/dummy_category_data.dart';
import 'package:meals_menu_recipe/data/dummy_meals_data.dart';
import 'package:meals_menu_recipe/models/category_model.dart';
import 'package:meals_menu_recipe/models/meal_model.dart';
import 'package:meals_menu_recipe/pages/meals_information_page.dart';
import 'package:meals_menu_recipe/widgets/category_grid_item.dart';

class MealCategories extends StatelessWidget{
  const MealCategories({super.key});

  void _selectCategory (BuildContext context, CategoryModel categoryModel) { // it will take a context parameter because in stateless widget there is no context present out of build method
    List<MealModel> mealsList = dummyMealData.where((meal) => meal.categories.contains(categoryModel.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MealsInformationPage(
        title: categoryModel.title, 
        meals: mealsList,
      ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick your category"),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2, // width/height
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: //dummyCategoryList.map((category) => CategoryGridItem(categoryModel: category))
        [
          for (final category in dummyCategoryList)
            CategoryGridItem(
              categoryModel: category,
              onSelectedCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
    );
  }
}