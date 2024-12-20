// on click of every meals category
import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/models/meal_model.dart';

class MealsInformationPage extends StatelessWidget{
  const MealsInformationPage ({
    super.key, 
    required this.title,
    required this.meals,
  });

  // which category type screen is now cliked and opened
  final String title;
  final List<MealModel> meals;

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
          return Text(
            meals[index].title,
          );
        },
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}