import 'package:flutter/material.dart';
import 'package:recipe_app/constance/theme_constance.dart';

class IngredientHorizontal extends StatelessWidget {
  final Widget pictureWidg;
  final String name;
  final Widget? rightIconWidg;
  final Color? boxColor;
  final VoidCallback? onTapRightIcon;

  const IngredientHorizontal({
    Key? key,
    required this.pictureWidg,
    required this.name,
    this.rightIconWidg,
    this.boxColor = ThemeColors.greyLight,
    this.onTapRightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: ThemeColors.primaryLight,
        height: 70,
        child: Row(
          children: [
            Container(
              // color: ThemeColors.grey,
              width: 70,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: Container(
                  // color: ThemeColors.greyLight,
                  height: 70,
                  child: pictureWidg,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              // color: ThemeColors.scaffold,
              height: 60,
              alignment: Alignment.center,
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: ThemeFonts.rb14,
              ),
            ),
            Expanded(
              child: Container(
                // alignment: Alignment.centerRight,
                // color: ThemeColors.greyLight,
                height: 50,
              ),
            ),
            GestureDetector(
              onTap: onTapRightIcon,
              child: Container(
                // alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 38,
                // width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(11),
                  child: Center(child: rightIconWidg),
                ),
              ),
            ),
          ],
        ));
  }
}
