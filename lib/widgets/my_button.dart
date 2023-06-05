import 'package:flutter/material.dart';
import 'package:recipe_app/constance/theme_constance.dart';

class MyButton extends StatelessWidget {
  final Widget iconWidg;
  final String text;
  final VoidCallback onTap;

  const MyButton(
      {Key? key, required this.iconWidg, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [ThemeColors.light, ThemeColors.primary],
                stops: [0.0, 0.15],
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: ThemeColors.primaryDark,
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(15.0),
                child: iconWidg,
              ),
              Expanded(
                child: Center(
                    child: Text(
                  text,
                  style: ThemeFonts.r15,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
