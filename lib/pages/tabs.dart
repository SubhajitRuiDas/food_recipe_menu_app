import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/pages/meal_categories.dart';
import 'package:meals_menu_recipe/pages/meals_information_page.dart';

class Tabs extends StatefulWidget{
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _SelectedScreen = 0;  // 0 for category screen 1 for favourite item screen
  
  void _selecteAScreen(int index) {
    setState(() {
      _SelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const MealCategories();
    
    String activePageTitle = "Categories";

    if(_SelectedScreen == 1) {
      activePage = const MealsInformationPage(meals: []);
      activePageTitle = "Your Favourties";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        centerTitle: true,
      ),
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