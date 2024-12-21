import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/models/meal_model.dart';
import 'package:meals_menu_recipe/widgets/meals_item_lower_metadata.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItemWidget extends StatelessWidget{
  const MealsItemWidget ({
    super.key,
    required this.mealModel,
  });

  final MealModel mealModel;

  String get complexityText {
    return mealModel.complexity.name[0].toUpperCase() + mealModel.complexity.name.substring(1);
  }

  String get affordabilityText {
    return mealModel.affordability.name[0].toUpperCase() + mealModel.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge, // this will cut off portions those are out of the card parameter, i.e here it is corner radius
      elevation: 3.0,
      child: InkWell(  // InkWell make the Card widget clikable widget
        onTap: () {
          
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(mealModel.imageUrl),
              fit: BoxFit.fill,
              height: 270,
              width: double.infinity, // Optionally make it full width
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 40,),
                child: Column(
                  children: [
                    Text(
                      mealModel.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealsItemLowerMetadata(
                          iconData: Icons.schedule, 
                          lableText: "${mealModel.duration} min",
                        ),
                        const SizedBox(width: 4,),
                        MealsItemLowerMetadata(
                          iconData: Icons.food_bank, 
                          lableText: complexityText,
                        ),
                        const SizedBox(width: 4,),
                        MealsItemLowerMetadata(
                          iconData: Icons.attach_money,
                          lableText: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}