import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/models/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsDetailsPage extends StatelessWidget {
  const MealsDetailsPage ({
    super.key,
    required this.mealModel
  });

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealModel.title),
        centerTitle: true,
      ),
      body: Card(
        elevation: 5,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        child: FadeInImage(
          placeholder: MemoryImage(kTransparentImage), 
          image: NetworkImage(mealModel.imageUrl),
          fit: BoxFit.fill,
          height: 270,
        ),
      ),
    );
  }
}