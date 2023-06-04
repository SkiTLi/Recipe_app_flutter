import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/state/ingredient_list/ingredient_list_cubit.dart';
import 'package:recipe_app/state/ingredient_list/ingredient_list_state.dart';
import 'package:recipe_app/widgets/custom_text_field.dart';
import 'package:recipe_app/widgets/ingredient_vertical.dart';
import 'package:recipe_app/widgets/my_app_bar.dart';
import 'package:recipe_app/widgets/number_of_ingredients.dart';

class ComposeYourMealScreen extends StatefulWidget {
  ComposeYourMealScreen({Key? key}) : super(key: key);

  @override
  State<ComposeYourMealScreen> createState() => _ComposeYourMealScreenState();
}

class _ComposeYourMealScreenState extends State<ComposeYourMealScreen> {
  final _titleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  void _navigateBack(BuildContext context) => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.scaffold,
        appBar: MyAppBar(
          title: 'COMPOSE YOUR MEAL',
          iconLeft: GestureDetector(
            // onTap: () => _prt(),
            onTap: () {},
            child: SvgPicture.asset('assets/images/arrow.svg'),
          ),
          iconRight: const NumberOfIngredients(),
          // backgroundColor: Colors.indigo,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
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
                    style: ThemeFonts.rb14),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ThemeColors.primaryLight,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: ThemeColors.primary,
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset('assets/images/barcode.svg'),
                      ),
                      const Expanded(
                        child: Center(
                            child: Text(
                          'Scan EAN code',
                          style: ThemeFonts.rp15,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    style: ThemeFonts.rb14,
                    'Last search',
                  ),
                ),
              ),
              Container(
                height: 128,
                //
                //
                child: BlocBuilder<IngredientListCubit, IngredientListState>(
                  builder: (context, state) {
                    if (state is IngredientListLoadingState) {
                      return const _Loading();
                    }
                    if (state is IngredientListLoadedState) {
                      return _Loaded(
                          ingredients:
                              (state as IngredientListLoadedState).ingredients);
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
              )
            ],
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

class _Loaded extends StatelessWidget {
  final List<Ingredient> ingredients;

  const _Loaded({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('---ingredients.length=${ingredients.length}');
    return ListView.separated(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => IngredientVertical(
              pictureWidg: Image.network(ingredients[index].picture.toString()),
              name: ingredients[index].name,
            ),
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: ingredients.length);
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
