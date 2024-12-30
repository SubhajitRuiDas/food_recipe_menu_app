import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/pages/tabs.dart';
import 'package:meals_menu_recipe/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFreeFilter = false;
  var _isLactoseFreeFilter = false;
  var _isVegetarianFreeFilter = false;
  var _isVeganFreeFilter = false;

  void _selectAScreen(String identifier) {
    if( identifier == "meals" ){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Tabs(),),
      );
    }
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
      drawer: MainDrawer(
        onSelectedScreen: _selectAScreen,
      ),
      body: Column(
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
    );
  }
}