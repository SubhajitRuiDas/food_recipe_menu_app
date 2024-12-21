import 'package:flutter/material.dart';

class MealsItemLowerMetadata extends StatelessWidget{
  const MealsItemLowerMetadata ({super.key, required this.iconData, required this.lableText});

  final IconData iconData;
  final String lableText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, color: Colors.white,),
        const SizedBox(width: 5,),
        Text(
          lableText,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}