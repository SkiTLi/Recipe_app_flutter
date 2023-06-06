import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recipe_app/constance/theme_constance.dart';
import 'package:recipe_app/screens/prepared_recipes_screen.dart';
import 'package:recipe_app/state/recipe_list/recipe_list_by_cubit.dart';
import 'package:recipe_app/widgets/my_app_bar.dart';

class LoadingRecipesScreen extends StatelessWidget {
  final LoadMethod load;
  final String byThisItem;

  const LoadingRecipesScreen(
      {Key? key, required this.byThisItem, required this.load})
      : super(key: key);

  void _navigateBack(BuildContext context) => Navigator.of(context).pop();

  void _navigateLoadedRecipesScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PreparedRecipesScreen(load: load, byThisItem: byThisItem)));
  }

  @override
  Widget build(BuildContext context) {
    _navigateLoadedRecipesScreen(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.scaffold,
        appBar: MyAppBar(
          title: 'PREPARING RECIPES',
          iconLeft: GestureDetector(
            onTap: () => _navigateBack(context),
            child: SvgPicture.asset('assets/images/arrow.svg'),
          ),
          iconRight: const SizedBox(),
          backgroundColor:
              ThemeColors.primaryLight, // backgroundColor: Colors.indigo,
        ),
        body: ListView(
          children: [
            Container(
              height: 350,
              // width: 200,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: ThemeColors.primaryLight,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        alignment: Alignment.center,
                        height: 180,
                        width: 120,
                        child: SvgPicture.asset('assets/images/hourglass.svg')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  const SizedBox(height: 35),
                  LinearPercentIndicator(
                    animation: true,
                    lineHeight: 18,
                    animationDuration: 3000,
                    percent: 1,
                    barRadius: const Radius.circular(9),
                    progressColor: ThemeColors.primary,
                    backgroundColor: ThemeColors.scaffold,
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    textAlign: TextAlign.center,
                    'Looking for your recipes',
                    style: ThemeFonts.rp24,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Please wait a moment...',
                    style: ThemeFonts.rg14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
