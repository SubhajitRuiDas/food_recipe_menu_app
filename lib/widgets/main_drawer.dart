import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/pages/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectedScreen});

  final void Function(String identifier) onSelectedScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood, color: Theme.of(context).colorScheme.primary,),
                const SizedBox(width: 18,),
                Text("Cooking up!", 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu, size: 25, 
            color: Theme.of(context).colorScheme.secondary,),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectedScreen("meals");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 25, 
            color: Theme.of(context).colorScheme.secondary,),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
              ),
            ),
            onTap: () {
              onSelectedScreen("filters");
            },
          ),
        ],
      ),
    );
  }
}