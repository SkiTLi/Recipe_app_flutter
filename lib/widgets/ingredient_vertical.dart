import 'package:flutter/material.dart';
import 'package:recipe_app/constance/theme_constance.dart';

class IngredientVertical extends StatelessWidget {
  final Widget pictureWidg;
  final String name;

  const IngredientVertical({
    Key? key,
    required this.pictureWidg,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 82,
      height: 128,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 108,
              width: 82,
              decoration: BoxDecoration(
                  color: ThemeColors.greyLight,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Positioned(
            top: 0,
            // left: 4,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
                alignment: Alignment.center,
                height: 86,
                width: 74,
                // width: 60,
                child: pictureWidg),
          ),
          Positioned(
            bottom: 0,
            left: 6,
            child: Container(
              alignment: Alignment.center,
              height: 52,
              width: 70,
              child: Text(
                textAlign: TextAlign.center,
                name,
                style: ThemeFonts.rb9,
              ),
            ),
          )
        ],
      ),
    );
  }
}
