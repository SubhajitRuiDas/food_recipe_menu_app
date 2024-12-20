import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/models/category_model.dart';

class CategoryGridItem extends StatelessWidget{
  const CategoryGridItem({
    super.key, 
    required this.categoryModel,
    required this.onSelectedCategory,
  });

  final CategoryModel categoryModel;
  final void Function() onSelectedCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(// InkWell will make this widget a clickable widget
      onTap: onSelectedCategory,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              categoryModel.color.withOpacity(0.5),
              categoryModel.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          categoryModel.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}