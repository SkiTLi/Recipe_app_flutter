import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/state/category_list/category_list_cubit.dart';
import 'package:recipe_app/state/category_list/category_list_state.dart';
import 'package:recipe_app/state/recipe_list/recipe_list_cubit.dart';
import 'package:recipe_app/state/recipe_list/recipe_list_state.dart';
import 'package:recipe_app/widgets/food_category.dart';
import 'package:recipe_app/widgets/my_app_bar.dart';
import 'package:recipe_app/widgets/text_recipe_preview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ThemeColors.scaffold,
          appBar: MyAppBar(
            title: 'RECIPE APP',
            iconLeft: SvgPicture.asset('assets/images/menu.svg'),
            iconRight: SvgPicture.asset('assets/images/avatar.svg'),
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Container(
                height: 200,
                child: BlocBuilder<CategoryListCubit, CategoryListState>(
                  builder: (context, state) {
                    if (state is CategoryListLoadingState) {
                      return const _Loading();
                    }
                    if (state is CategoryListLoadedState) {
                      return _LoadedCategories(
                          categories:
                              (state as CategoryListLoadedState).categories);
                    }
                    if (state is RecipeListErrorState) {
                      return _Error(
                        errorText: (state as CategoryListErrorState).errorText,
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 122,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
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
                          const SizedBox(
                            width: 148,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Compose your\nown meal.',
                              style: ThemeFonts.r20,
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            //click work on a empty area
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
                              child: const Center(
                                child: Text(
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
          ])),
    );
//
//
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
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => TextRecipePreview(
              name: recipes[index].name,
              picture: recipes[index].picture.toString(),
              category: recipes[index].category,
            ),
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: recipes.length);
  }
}

class _LoadedCategories extends StatelessWidget {
  final List<Category> categories;

  const _LoadedCategories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('---ingredients.length=${ingredients.length}');
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return FoodCategory(
            category: categories[index].name,
            picture: categories[index].picture.toString(),
          );
        });
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
