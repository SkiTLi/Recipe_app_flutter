import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/widgets/ingredient_horizontal.dart';
import 'package:recipe_app/widgets/my_app_bar.dart';
import 'package:recipe_app/widgets/my_button.dart';

class MyIngredientsScreen extends StatefulWidget {
  final List<Ingredient> addedIngredients;

  void removeIngredient(Ingredient ingredient) {
    addedIngredients.remove(ingredient);
  }

  MyIngredientsScreen({Key? key, required this.addedIngredients})
      : super(key: key);

  @override
  State<MyIngredientsScreen> createState() => _MyIngredientsScreenState();
}

class _MyIngredientsScreenState extends State<MyIngredientsScreen> {
  final _formKey = GlobalKey<FormState>();

  void _navigateBack(BuildContext context) => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: ThemeColors.scaffold,
          appBar: MyAppBar(
            title: 'COMPOSE YOUR MEAL',
            iconLeft: GestureDetector(
              onTap: () => _navigateBack(context),
              child: SvgPicture.asset('assets/images/arrow.svg'),
            ),
          ),
          body: SizedBox.expand(
            child: Column(
              key: _formKey,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      style: ThemeFonts.bb18,
                      'My ingredients',
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      // scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => IngredientHorizontal(
                            pictureWidg: Image.network(widget
                                .addedIngredients[index].picture
                                .toString()),
                            name: widget.addedIngredients[index].name,
                            onTapRightIcon: () => widget.removeIngredient(
                                widget.addedIngredients[index]),
                            // rightIconWidg: Text("Icons.add and jjgjhbjb"),
                            rightIconWidg: SizedBox(
                                width: 15,
                                height: 15,
                                child: SvgPicture.asset(
                                    'assets/images/rubbish.svg')),
                          ),
                      separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 1,
                              color: ThemeColors.greyLight,
                            ),
                          ),
                      itemCount: widget.addedIngredients.length),
                ),
                MyButton(
                  iconWidg: SvgPicture.asset(
                    'assets/images/searchWhite.svg',
                  ),
                  text: 'Search recipes',
                  onTap: () => print(widget.addedIngredients), //todo
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
