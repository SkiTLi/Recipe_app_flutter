import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/state/recipe_list/recipe_list_state.dart';

class RecipeListCubit extends Cubit<RecipeListState> {
  final _recipeProvider = RecipeProvider();

  RecipeListCubit() : super(RecipeListLoadingState()) {
    _loadRandomRecipes(3); // load numberOfRecipes
    // _loadRecipesByCategory('Beef');
  }

  void _completeLoading(List<Recipe> recipes) {
    if (recipes.isEmpty) {
      emit(RecipeListEmptyState());

      return;
    }
    emit(RecipeListLoadedState(recipes));
  }

  void _loadRandomRecipes(int numberOfRecipes) async {
    // List<Recipe> recipes = [];

    try {
      List<Recipe> recipes = [];
      for (int i = 0; i < numberOfRecipes; i++) {
        recipes.add((await _recipeProvider.getRandomRecipe()).first);
      }

      // final recipes = await _recipeProvider.getRandomRecipe();
      // final recipes = await _recipeProvider.getRecipesByCategory('Beef');
      // final recipes = await _recipeProvider.getRecipesByFirstLetter();
      _completeLoading(recipes);

      // print('---recipes=$recipes');
      emit(RecipeListLoadedState(recipes));
    } catch (e, stack) {
      emit(RecipeListErrorState('ErrorAK: $e, $stack'));
      rethrow;
    }
  }

  void _loadRecipesByCategory(String category) async {
    // List<Recipe> recipes = [];

    try {
      // final recipes = await _recipeProvider.getRandomRecipe();
      final recipes = await _recipeProvider.getRecipesByCategory(category);
      // final recipes = await _recipeProvider.getRecipesByFirstLetter();
      _completeLoading(recipes);

      // print('---recipes=$recipes');
      emit(RecipeListLoadedState(recipes));
    } catch (e, stack) {
      emit(RecipeListErrorState('ErrorAK: $e, $stack'));
      rethrow;
    }
  }
}
