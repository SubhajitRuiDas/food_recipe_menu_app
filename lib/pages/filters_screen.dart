import 'package:flutter/material.dart';
import 'package:meals_menu_recipe/pages/tabs.dart';
import 'package:meals_menu_recipe/widgets/main_drawer.dart';

import 'package:meals_menu_recipe/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

//   @override
//   ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var _isGlutenFreeFilter = false;
//   var _isLactoseFreeFilter = false;
//   var _isVegetarianFreeFilter = false;
//   var _isVeganFreeFilter = false;

  // @override
  // void initState() {
  //   super.initState();

  //   final activeFilters = ref.read(filtersProvider);
  //   _isGlutenFreeFilter = activeFilters[Filters.glutenFree]!;
  //   _isLactoseFreeFilter = activeFilters[Filters.lactoseFree]!;
  //   _isVegetarianFreeFilter = activeFilters[Filters.vegetarian]!;
  //   _isVeganFreeFilter = activeFilters[Filters.vegan]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Filters",
        ),
        centerTitle: true,
      ),
      body:Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filters.glutenFree]!, 
              onChanged: (newValue) {
                ref.read(filtersProvider.notifier).setFilter(Filters.glutenFree, newValue);
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
              value: activeFilters[Filters.lactoseFree]!, 
              onChanged: (newValue) {
                ref.read(filtersProvider.notifier).setFilter(Filters.lactoseFree, newValue);
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
              value: activeFilters[Filters.vegetarian]!, 
              onChanged: (newValue) {
                ref.read(filtersProvider.notifier).setFilter(Filters.vegetarian, newValue);
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
              value: activeFilters[Filters.vegan]!, 
              onChanged: (newValue) {
                ref.read(filtersProvider.notifier).setFilter(Filters.vegan, newValue);
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