import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_menu_recipe/provider/favourite_meals_provider.dart';
import 'package:meals_menu_recipe/provider/meals_provider.dart';

import 'package:meals_menu_recipe/provider/filters_provider.dart';
import 'package:meals_menu_recipe/pages/filters_screen.dart';
import 'package:meals_menu_recipe/pages/meal_categories.dart';
import 'package:meals_menu_recipe/pages/meals_information_page.dart';
import 'package:meals_menu_recipe/widgets/main_drawer.dart';

class Tabs extends ConsumerStatefulWidget{
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() => _TabsState();
}

class _TabsState extends ConsumerState<Tabs> {

  void _setAScreen(String identifier) async{
    if(identifier == "filters"){
      Navigator.of(context).pop();
      await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(builder: (context) => const FiltersScreen(),),
      );
      // print(returnResult);

    }else {
      // it is a meals screen close the drawer
      Navigator.of(context).pop();
    }
  }

  // void _showSnackbarMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text(message),),
  //   );
  // }

  // void _manageFavouriteMealsWithFunc(MealModel mealModel) {
  //   var _isAlreadyPresent = _favouriteMealsList.contains(mealModel);

  //   if(_isAlreadyPresent == true) {
  //     setState(() {
  //       _favouriteMealsList.remove(mealModel);
  //     });
  //     _showSnackbarMessage("Meal is no longer in favourite");
  //   } else {
  //     setState(() {
  //       _favouriteMealsList.add(mealModel);
  //     });
  //     _showSnackbarMessage("Meal added to favourites");
  //   }

  // }
  int _SelectedScreen = 0;  // 0 for category screen 1 for favourite item screen
  
  void _selecteAScreen(int index) {
    setState(() {
      _SelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = MealCategories(
      availableMeals: availableMeals,
    );
    
    String activePageTitle = "Categories";

    final favoriteMealsList = ref.watch(favoriteMeals);

    if(_SelectedScreen == 1) {
      activePage = MealsInformationPage(meals: favoriteMealsList,);
      activePageTitle = "Your Favourties";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        centerTitle: true,
      ),
      drawer: MainDrawer(onSelectedScreen: _setAScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexOfScreen) {
          // typically this bottomnavigation bar change the tab screen based on an integer value typically an index value for each tab 
          // here flutter will call the function whenever user will click any Tab
          // {void Function(int)? onTap}

          _selecteAScreen(indexOfScreen);
        },
        currentIndex: _SelectedScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}