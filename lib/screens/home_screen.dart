import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';
import 'package:recipe_app/state/recipe_list/recipe_list_cubit.dart';
import 'package:recipe_app/state/recipe_list/recipe_list_state.dart';
import 'package:recipe_app/widgets/food_category.dart';
import 'package:recipe_app/widgets/nav_bar.dart';

import 'package:recipe_app/widgets/text_recipe_preview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.scaffold,
        appBar: AppBar(
          backgroundColor: ThemeColors.scaffold,
          elevation: 0,
          //without shadow
          title: const Text(
            'RECIPE APP',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: ThemeColors.primary,
            ),
          ),
          centerTitle: true,
          actions: [
            SizedBox(
                width: 32,
                child: SvgPicture.asset(
                  'assets/images/avatar.svg',
                )),
            const SizedBox(width: 20),
          ],
          leading: Row(children: [
            const SizedBox(width: 20, height: 40),
            SvgPicture.asset('assets/images/menu.svg'),
          ]),
        ),
        body: ListView(children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 11),
              child: Text(
                style: ThemeFonts.bb18,
                'Promo recipe',
              ),
            ),
          ),
          Container(
            height: 180,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              TextRecipePreview(
                picture: 'assets/images/avatar.svg',
                category: 'SOUP',
                description: 'Soup with cooked mushroms',
              ),
              Placeholder(),

              // itemCount: users.length,
              // itemBuilder: (context, index) => UserCard(user: users[index]),
              // separatorBuilder: (context, index) => const SizedBox(height: 16),
            ]

                // comments.map((e) => Comment()).toList(),
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Container(
              height: 200,
              child: GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 3,

                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(6, (index) {
                    return Center(
                      // children: [
                      child: FoodCategory(
                        picture: 'assets/images/OwnMeal.png',
                        category: 'SOUP',
                      ),
                      // ],
                    );
                  })),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 122,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ThemeColors.primary, ThemeColors.light],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/OwnMeal.png'),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 148,
                          child: const Text(
                            'Compose your' + '\n  own meal.',
                            style: ThemeFonts.r20,
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque, //click work on a empty area
                          onTap: () {},
                          child: Container(
                            width: 148,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              border: Border.all(
                                color: ThemeColors.scaffold,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: const Text(
                                'Compose meal',
                                style: ThemeFonts.r9,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ]));
//
//

  }
}
