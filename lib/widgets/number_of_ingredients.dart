import 'package:flutter/material.dart';
import 'package:recipe_app/constance/theme_constance.dart';

class NumberOfIngredients extends StatelessWidget {
  final int number;

  const NumberOfIngredients({Key? key, this.number = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          color: ThemeColors.primaryLight, borderRadius: BorderRadius.circular(12)),
      // padding: const EdgeInsets.all(9.0),
      child: Center(child: Text(number.toString(), style: ThemeFonts.bp14,)),
    );
  }
}
