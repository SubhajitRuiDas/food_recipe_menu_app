import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/models/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItemWidget extends StatelessWidget{
  const MealsItemWidget ({
    super.key,
    required this.mealModel,
  });

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(  // InkWell make the Card widget clikable widget
        onTap: () {
          
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(mealModel.imageUrl),
              
            ),
          ],
        ),
      ),
    );
  }
}