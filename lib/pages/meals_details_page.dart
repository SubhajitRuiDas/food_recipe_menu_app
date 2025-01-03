import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_menu_recipe/models/meal_model.dart';
import 'package:meals_menu_recipe/provider/favourite_meals_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsDetailsPage extends ConsumerWidget {
  const MealsDetailsPage ({
    super.key,
    required this.mealModel,
  });

  final MealModel mealModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealModel.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              bool isAdded = ref.read(favoriteMeals.notifier).toggleFavoriteMealsState(mealModel); //either add or remove
              
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(isAdded ? "Meal is added as a favorite" 
                : "Meal is removed from favorite"),),
              );
            }, 
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: Card(
        elevation: 5,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        child: SingleChildScrollView(
          child: Column(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage), 
                image: NetworkImage(mealModel.imageUrl),
                fit: BoxFit.fill,
                height: 270,
              ),
              const SizedBox(height: 15,),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15,),
              for (final ingredients in mealModel.ingredients)
                Text(
                  ingredients,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              const SizedBox(height: 20,),
              Text(
                "Steps",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15,),
              for (final step in mealModel.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10, 
                    vertical: 15,
                  ),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}