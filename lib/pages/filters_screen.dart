import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/pages/tabs.dart';
import 'package:meals_menu_recipe/widgets/main_drawer.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filters, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFreeFilter = false;
  var _isLactoseFreeFilter = false;
  var _isVegetarianFreeFilter = false;
  var _isVeganFreeFilter = false;

  @override
  void initState() {
    super.initState();

    _isGlutenFreeFilter = widget.currentFilters[Filters.glutenFree]!;
    _isLactoseFreeFilter = widget.currentFilters[Filters.lactoseFree]!;
    _isVegetarianFreeFilter = widget.currentFilters[Filters.vegetarian]!;
    _isVeganFreeFilter = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Filters",
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop({
              Filters.glutenFree: _isGlutenFreeFilter,
              Filters.lactoseFree: _isLactoseFreeFilter,
              Filters.vegetarian: _isVegetarianFreeFilter,
              Filters.vegan: _isVeganFreeFilter,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _isGlutenFreeFilter, 
              onChanged: (newValue) {
                setState(() {
                  _isGlutenFreeFilter = newValue;
                });
              },
              title: Text(
                "Gluten-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              subtitle: Text(
                "Only include gluten free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              contentPadding: const EdgeInsets.only(left: 30, right: 20,),
            ),
            SwitchListTile(
              value: _isLactoseFreeFilter, 
              onChanged: (newValue) {
                setState(() {
                  _isLactoseFreeFilter = newValue;
                });
              },
              title: Text(
                "Lactose-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              subtitle: Text(
                "Only include lactose free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              contentPadding: const EdgeInsets.only(left: 30, right: 20,),
            ),
            SwitchListTile(
              value: _isVegetarianFreeFilter, 
              onChanged: (newValue) {
                setState(() {
                  _isVegetarianFreeFilter = newValue;
                });
              },
              title: Text(
                "Vegetarian-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              subtitle: Text(
                "Only include vegetarian free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              contentPadding: const EdgeInsets.only(left: 30, right: 20,),
            ),
            SwitchListTile(
              value: _isVeganFreeFilter, 
              onChanged: (newValue) {
                setState(() {
                  _isVeganFreeFilter = newValue;
                });
              },
              title: Text(
                "Vegan-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              subtitle: Text(
                "Only include vegan free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              contentPadding: const EdgeInsets.only(left: 30, right: 20,),
            ),
          ],
        ),
      ),
    );
  }
}