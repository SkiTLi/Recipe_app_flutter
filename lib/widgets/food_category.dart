import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';

class FoodCategory extends StatelessWidget {
  final String category;
  final String picture;

  const FoodCategory({
    Key? key,
    required this.category,
    required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              picture,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          style: ThemeFonts.rg14,
          category,

        ),
      ],
    );
  }
}
