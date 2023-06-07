import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';
import 'package:recipe_app/models/cart.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/screens/my_ingredients_screen.dart';
import 'package:recipe_app/state/cart_state.dart';
import 'package:recipe_app/widgets/custom_text_field.dart';
import 'package:recipe_app/widgets/ingredient_horizontal.dart';
import 'package:recipe_app/widgets/my_app_bar.dart';
import 'package:recipe_app/widgets/my_button.dart';
import 'package:recipe_app/widgets/number_of_ingredients.dart';

class SearchIngredientsScreen extends StatelessWidget {
  final List<Ingredient> allIngredients;

  SearchIngredientsScreen({Key? key, required this.allIngredients})
      : super(key: key);

  final _formKey = GlobalKey<FormState>();
  // var myCart = Cart([]);
  List<Ingredient> foundIngredients = [];
  final _searchIngredientController = TextEditingController();

  void _navigateBack(BuildContext context) => Navigator.of(context).pop();

  void _navigateMyIngredientsScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MyIngredientsScreen()));
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _addToCart(BuildContext context, Ingredient ingredient) {
    context.read<CartCubit>().addIngredient(ingredient);
  }

  Cart findSimilarIngredientsByPartOfName(String partOfName) {
    final cart = Cart([]);
    if (partOfName != '') {
      allIngredients.forEach((item) {
        if (item.name.toLowerCase().contains(partOfName.toLowerCase())) {
          cart.addIngredient(item);
        }
      });
    }
    return cart;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ThemeColors.scaffold,
          appBar: MyAppBar(
            title: 'COMPOSE YOUR MEAL',
            iconLeft: GestureDetector(
              onTap: () => _navigateBack(context),
              child: SvgPicture.asset('assets/images/arrow.svg'),
            ),
            iconRight: BlocBuilder<CartCubit, Cart>(builder: (context, cart) {
              return NumberOfIngredients(
                number: cart.ingredients.length,
              );
            }),
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
                      'Add ingredient',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomTextField(
                    controller: _searchIngredientController,
                    placeholder: 'Search ingredient',
                    style: ThemeFonts.rb14,
                    onTapIcon: () {
                      foundIngredients = findSimilarIngredientsByPartOfName(
                              _searchIngredientController.text)
                          .ingredients;
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      style: ThemeFonts.rb14,
                      'Results',
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<CartCubit, Cart>(builder: (context, cart) {
                    return ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (context, index) => IngredientHorizontal(
                              pictureWidg: Image.network(
                                  foundIngredients[index].picture.toString()),
                              name: foundIngredients[index].name,
                              boxColor: ThemeColors.greyLight,
                              onTapRightIcon: () {
                                if (!cart.ingredients
                                    .contains(foundIngredients[index])) {
                                  // cart.addIngredient(foundIngredients[index]);
                                  _addToCart(context, foundIngredients[index]);
                                }
                              },
                              rightIconWidg: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child:
                                      SvgPicture.asset('assets/images/plus.svg')),
                            ),
                        separatorBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: 1,
                                color: ThemeColors.greyLight,
                              ),
                            ),
                        itemCount: foundIngredients.length);
                  }),
                ),
                MyButton(
                  iconWidg: SvgPicture.asset(
                    'assets/images/listWhite.svg',
                    // fit: BoxFit.scaleDown,
                  ),
                  text: 'Check my list',
                  onTap: () => _navigateMyIngredientsScreen(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
