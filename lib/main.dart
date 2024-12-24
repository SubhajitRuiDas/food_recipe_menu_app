import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:meals_menu_recipe/data/dummy_meals_data.dart';
// import 'package:meals_menu_recipe/pages/meal_categories.dart';
import 'package:meals_menu_recipe/pages/tabs.dart';
// import 'package:meals_menu_recipe/pages/meals_information_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 56, 104, 183),
        ),
        useMaterial3: true, 
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const Tabs(),
    );
  }
}

