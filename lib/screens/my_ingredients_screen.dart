import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';
import 'package:recipe_app/models/cart.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/state/cart_state.dart';
import 'package:recipe_app/widgets/ingredient_horizontal.dart';
import 'package:recipe_app/widgets/my_app_bar.dart';
import 'package:recipe_app/widgets/my_button.dart';
import 'package:recipe_app/widgets/number_of_ingredients.dart';
// import 'package:provider/provider.dart';

class MyIngredientsScreen extends StatelessWidget {
  MyIngredientsScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  void _navigateBack(BuildContext context) => Navigator.of(context).pop();

  void _removeFromCart(BuildContext context, Ingredient ingredient) {
    context.read<CartCubit>().removeIngredient(ingredient);
  }

  @override
  Widget build(BuildContext context) {
    // final cart = context.watch<CartCubit>().state;
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
            // iconRight: BlocBuilder<CartCubit, Cart>(builder: (context, cart1) {
            //   return NumberOfIngredients(
            //     number: cart1.ingredients.length,
            //   );
            // }),
          ),
          body: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  child: BlocBuilder<CartCubit, Cart>(builder: (context, cart) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        if (index == cart.ingredients.length) {
                          return GestureDetector(
                            onTap: () => _navigateBack(context),
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              dashPattern: const [5, 5],
                              color: ThemeColors.primary,
                              strokeWidth: 1,
                              child: Container(
                                height: 48,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: ThemeColors.scaffold,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                    child: Text(
                                  'Add ingredient',
                                  style: ThemeFonts.rp15,
                                )),
                              ),
                            ),
                          );
                        }

                        return IngredientHorizontal(
                          pictureWidg: Image.network(
                              cart.ingredients[index].picture.toString()),
                          name: cart.ingredients[index].name,
                          onTapRightIcon: () {
                            _removeFromCart(context,
                                cart.ingredients[index]); //not work stable
                          },
                          rightIconWidg: SizedBox(
                              width: 15,
                              height: 15,
                              child: SvgPicture.asset(
                                  'assets/images/rubbish.svg')),
                        );
                      },
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          height: 1,
                          color: ThemeColors.greyLight,
                        ),
                      ),
                      itemCount: cart.ingredients.length + 1,
                    );
                  }),
                ),
                MyButton(
                  iconWidg: SvgPicture.asset(
                    'assets/images/searchWhite.svg',
                  ),
                  text: 'Search recipes',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
