import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/widgets/nav_bar.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: ThemeColors.scaffold,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const Positioned(
              child: HomeScreen(),
            ),
            const Positioned(
              top: 0,
              bottom: 100,
              //100 pixels
              left: 0,
              right: 0,
              child: TabBarView(children: [
                HomeScreen(),
                //  PreparedRecipesScreen(),
                // HomeScreen(),
                // LoadingRecipesScreen(),
              ]),
            ),
            const Positioned(
              left: 0,
              right: 0,
              height: 52,
              bottom: 0,
              child: NavBar(),
            ),
            Positioned(
              bottom: 21,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque, //click work on a empty area
                onTap: () {},
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19.0),
                    color: ThemeColors.primary,
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/images/searchWhite.svg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
