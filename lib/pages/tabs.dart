import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/models/meal_model.dart';
import 'package:meals_menu_recipe/pages/filters_screen.dart';
import 'package:meals_menu_recipe/pages/meal_categories.dart';
import 'package:meals_menu_recipe/pages/meals_information_page.dart';
import 'package:meals_menu_recipe/widgets/main_drawer.dart';

class Tabs extends StatefulWidget{
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final List<MealModel> _favouriteMealsList = [];

  void _setAScreen(String identifier) {
    if(identifier == "filters"){
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const FiltersScreen(),),
      );
    }else {
      // it is a meals screen close the drawer
      Navigator.of(context).pop();
    }
  }

  void _showSnackbarMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),),
    );
  }

  void _manageFavouriteMealsWithFunc(MealModel mealModel) {
    var _isAlreadyPresent = _favouriteMealsList.contains(mealModel);

    if(_isAlreadyPresent == true) {
      setState(() {
        _favouriteMealsList.remove(mealModel);
      });
      _showSnackbarMessage("Meal is no longer in favourite");
    } else {
      setState(() {
        _favouriteMealsList.add(mealModel);
      });
      _showSnackbarMessage("Meal added to favourites");
    }

  }
  int _SelectedScreen = 0;  // 0 for category screen 1 for favourite item screen
  
  void _selecteAScreen(int index) {
    setState(() {
      _SelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = MealCategories(toManageFavouriteMeal: _manageFavouriteMealsWithFunc,);
    
    String activePageTitle = "Categories";

    if(_SelectedScreen == 1) {
      activePage = MealsInformationPage(meals: _favouriteMealsList, 
      toManageFavouriteMeal: _manageFavouriteMealsWithFunc,);
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