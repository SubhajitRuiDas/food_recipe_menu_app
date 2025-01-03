// on click of every meals category
import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/models/meal_model.dart';
// import 'package:meals_menu_recipe/pages/meals_details_page.dart';
import 'package:meals_menu_recipe/widgets/meals_item_widget.dart';

class MealsInformationPage extends StatelessWidget{
  const MealsInformationPage ({
    super.key, 
    this.title,
    required this.meals,
  });

  // which category type screen is now cliked and opened
  final String? title; // it can be null
  final List<MealModel> meals;

  // void selectedMeal (BuildContext context, MealModel mealModel) {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) 
  //   => MealsDetailsPage(mealModel: mealModel)),);
  // }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uh Oh ..... nothing here",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 15,),
            Text(
              "Try selecting a different category!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      );
    
    if(meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealsItemWidget(
            mealModel: meals[index],
            // onSelectMealItem: (mealModel) {
            //   selectedMeal(context, mealModel);
            // },
          );
        },
      );
    }
    // i have to make this scaffold optional if i reach this screen from bottomTab then it will not use scaffold

    if(title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
      ),
      body: content,
    );
  }
}