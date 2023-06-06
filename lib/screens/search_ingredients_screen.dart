import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/screens/my_ingredients_screen.dart';
import 'package:recipe_app/state/ingredient_list/ingredient_list_cubit.dart';
import 'package:recipe_app/state/ingredient_list/ingredient_list_state.dart';
import 'package:recipe_app/widgets/custom_text_field.dart';
import 'package:recipe_app/widgets/ingredient_horizontal.dart';
import 'package:recipe_app/widgets/my_app_bar.dart';
import 'package:recipe_app/widgets/my_button.dart';
import 'package:recipe_app/widgets/number_of_ingredients.dart';

class SearchIngredientsScreen extends StatefulWidget {
  final List<Ingredient> addedIngredients = [];

  void addIngredient(Ingredient ingredient) {
    addedIngredients.add(ingredient) as Set;
  }

  SearchIngredientsScreen({Key? key}) : super(key: key);

  @override
  State<SearchIngredientsScreen> createState() =>
      _SearchIngredientsScreenState();
}

class _SearchIngredientsScreenState extends State<SearchIngredientsScreen> {
  final _titleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _navigateBack(BuildContext context) => Navigator.of(context).pop();

  void _navigateMyIngredientsScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MyIngredientsScreen(
              addedIngredients: widget.addedIngredients,
            )));
    FocusScope.of(context).requestFocus(FocusNode());
  }

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
            iconRight:
                NumberOfIngredients(number: widget.addedIngredients.length),
            // backgroundColor: Colors.indigo,
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
                    controller: _titleController,
                    placeholder: 'Search ingredient',
                    style: ThemeFonts.rb14,
                    onTapIcon: () {}, //todo
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
                  child: BlocBuilder<IngredientListCubit, IngredientListState>(
                    builder: (context, state) {
                      if (state is IngredientListLoadingState) {
                        return const _Loading();
                      }
                      if (state is IngredientListLoadedState) {
                        return ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemBuilder: (context, index) =>
                                IngredientHorizontal(
                                  pictureWidg: Image.network(state
                                      .ingredients[index].picture
                                      .toString()),
                                  name: state.ingredients[index].name,
                                  boxColor: ThemeColors.primaryLight,
                                  onTapRightIcon: () => widget
                                      .addIngredient(state.ingredients[index]),
                                  rightIconWidg: SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: SvgPicture.asset(
                                          'assets/images/plus.svg')),
                                ),
                            separatorBuilder: (context, index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    height: 1,
                                    color: ThemeColors.greyLight,
                                  ),
                                ),
                            itemCount: state.ingredients.length);
                      }
                      if (state is IngredientListErrorState) {
                        return _Error(
                          errorText:
                              (state as IngredientListErrorState).errorText,
                        );
                      }
                      return const Text(
                        style: ThemeFonts.rp15,
                        'Epic FAIL',
                      );
                    },
                  ),
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

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ThemeColors.primary,
      ),
    );
  }
}

class _Error extends StatelessWidget {
  final String errorText;

  const _Error({Key? key, required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: ThemeColors.error, borderRadius: BorderRadius.circular(4)),
      child: Text(errorText),
    );
  }
}
