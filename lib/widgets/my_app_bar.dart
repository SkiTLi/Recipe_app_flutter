import 'package:flutter/material.dart';
import 'package:recipe_app/constance/theme_constance.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Widget iconLeft;
  final Widget iconRight;

  const MyAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = ThemeColors.scaffold,
    this.iconLeft = const SizedBox(),
    this.iconRight = const SizedBox(),
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 56);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 12,
          width: double.infinity,
          decoration: BoxDecoration(color: backgroundColor),
        ),
        SizedBox(
          height: 32,
          child: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              title,
              style: ThemeFonts.bp14,
            ),
            actions: [
              SizedBox(
                height: 32,
                width: 32,
                child: iconRight,
              ),
              const SizedBox(width: 20),
            ],
            leading: Row(
              children: [
                const SizedBox(
                  width: 14,
                ),
                Padding(padding: const EdgeInsets.all(6), child: iconLeft),
              ],
            ),
          ),
        ),
        Container(
          height: 12,
          width: double.infinity,
          decoration: BoxDecoration(color: backgroundColor),
        ),
      ],
    );
  }
}
