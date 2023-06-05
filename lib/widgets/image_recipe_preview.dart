import 'package:flutter/material.dart';
import 'package:recipe_app/constance/theme_constance.dart';

class TextRecipePreview extends StatelessWidget {
  final String picture;
  final String category;
  final String name;

  const TextRecipePreview(
      {Key? key,
      required this.picture,
      required this.category,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: SizedBox(
        height: 180,
        width: 296,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                picture,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 50,
                width: 296,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ThemeColors.dark.withOpacity(0.3),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 28,
              // right: 0,
              left: 10,
              child: Text(
                category,
                style: ThemeFonts.r9,
              ),
            ),
            Positioned(
              bottom: 12,
              // right: 0,
              left: 10,
              child: Text(
                name,
                style: ThemeFonts.r16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
