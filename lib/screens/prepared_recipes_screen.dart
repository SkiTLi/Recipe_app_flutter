import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/state/recipe_list/recipe_list_by_cubit.dart';
import 'package:recipe_app/state/recipe_list/recipe_random_list_state.dart';
import 'package:recipe_app/widgets/my_app_bar.dart';
import 'package:recipe_app/widgets/recipe_preview.dart';

class PreparedRecipesScreen extends StatefulWidget {
  final LoadMethod load;
  final String byThisItem;

  const PreparedRecipesScreen(
      {Key? key, required this.load, required this.byThisItem})
      : super(key: key);

  @override
  State<PreparedRecipesScreen> createState() => _PreparedRecipesScreenState();
}

class _PreparedRecipesScreenState extends State<PreparedRecipesScreen> {
  late final List<Recipe> loadedRecipes;

  void _navigateBack(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecipeListByCubit(
        load: widget.load,
        byThisItem: widget.byThisItem,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ThemeColors.scaffold,
          appBar: MyAppBar(
            title: 'PREPARED RECIPES',
            iconLeft: GestureDetector(
              onTap: () => _navigateBack(context),
              child: SvgPicture.asset('assets/images/arrow.svg'),
            ),
            iconRight: const SizedBox(),
          ),
          body: BlocBuilder<RecipeListByCubit, RecipeListState>(
            builder: (context, state) {
              if (state is RecipeListLoadingState) {
                return const _Loading();
              }
              if (state is RecipeListLoadedState) {
                return SizedBox.expand(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              const Text(
                                style: ThemeFonts.bb18,
                                'Results:',
                              ),
                              Text(
                                style: ThemeFonts.rp15,
                                '${state.recipes.length} recipes',
                              ),
                              const Expanded(child: SizedBox()),
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
                          child: ListView.separated(
                            itemBuilder: (context, index) => RecipePreview(
                              name: state.recipes[index].name,
                              picture: state.recipes[index].picture.toString(),
                              category:
                                  state.recipes[index].category.toString(),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 20,
                              height: 10,
                            ),
                            itemCount: state.recipes.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state is RecipeListErrorState) {
                return _Error(
                  errorText: (state).errorText,
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
    ));
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
