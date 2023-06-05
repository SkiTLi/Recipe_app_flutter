import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/state/recipe_list/recipe_list_cubit.dart';
import 'package:recipe_app/state/recipe_list/recipe_list_state.dart';
import 'package:recipe_app/widgets/my_app_bar.dart';
import 'package:recipe_app/widgets/recipe_preview.dart';

class PreparedRecipesScreen extends StatefulWidget {
  const PreparedRecipesScreen({Key? key}) : super(key: key);

  @override
  State<PreparedRecipesScreen> createState() => _PreparedRecipesScreenState();
}

class _PreparedRecipesScreenState extends State<PreparedRecipesScreen> {
  final _formKey = GlobalKey<FormState>();

  void _navigateBack(BuildContext context) => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.scaffold,
        appBar: MyAppBar(
          title: 'PREPARED RECIPES',
          iconLeft: GestureDetector(
            // onTap: () => _prt(),
            onTap: () {},
            child: SvgPicture.asset('assets/images/arrow.svg'),
          ),
          iconRight: const SizedBox(),
          // backgroundColor: Colors.indigo,
        ),
        // body: Container(
        //   height: double.infinity,
        //   // width: double.infinity,
        //   child: ListView(
        body: SizedBox.expand(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        style: ThemeFonts.bb18,
                        'Results:',
                      ),
                      const Text(
                        style: ThemeFonts.rp15,
                        ' 14 recipes',
                      ),
                      Expanded(child: SizedBox()),
                      const Text(
                        style: ThemeFonts.rb12,
                        'Sort by:',
                      ),
                      const Text(
                        style: ThemeFonts.rp12,
                        ' popular',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // child: Expanded(
                  child: Container(
                    // color: ThemeColors.light,
                    // height: double.infinity,
                    // height: 300,
                    child: BlocBuilder<RecipeListCubit, RecipeListState>(
                      builder: (context, state) {
                        if (state is RecipeListLoadingState) {
                          return const _Loading();
                        }
                        if (state is RecipeListLoadedState) {
                          return _LoadedRecipes(
                              recipes: (state as RecipeListLoadedState).recipes);
                        }
                        if (state is RecipeListErrorState) {
                          return _Error(
                            errorText: (state as RecipeListErrorState).errorText,
                          );
                        }
                        return const Text(
                          style: ThemeFonts.rp15,
                          'Epic FAIL',
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
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

class _LoadedRecipes extends StatelessWidget {
  final List<Recipe> recipes;

  const _LoadedRecipes({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('---ingredients.length=${ingredients.length}');
    return ListView.separated(
        itemBuilder: (context, index) => RecipePreview(
              name: recipes[index].name,
              picture: recipes[index].picture.toString(),
              category: recipes[index].category,
            ),
        separatorBuilder: (context, index) => const SizedBox(
              width: 20,
              height: 10,
            ),
        itemCount: recipes.length);
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
