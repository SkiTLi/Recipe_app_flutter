import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/state/recipe_list/recipe_random_list_state.dart';

class RecipeRandomListCubit extends Cubit<RecipeListState> {
  final _recipeProvider = RecipeProvider();

  RecipeRandomListCubit() : super(RecipeListLoadingState()) {
    _loadRandomRecipes(3);
  }

  void _completeLoading(List<Recipe> recipes) {
    if (recipes.isEmpty) {
      emit(RecipeListEmptyState());

      return;
    }
    emit(RecipeListLoadedState(recipes));
  }

  void _loadRandomRecipes(int numberOfRecipes) async {
    try {
      List<Recipe> recipes = [];
      for (int i = 0; i < numberOfRecipes; i++) {
        recipes.add((await _recipeProvider.getRandomRecipe()).first);
      }
      _completeLoading(recipes);

      emit(RecipeListLoadedState(recipes));
    } catch (e, stack) {
      emit(RecipeListErrorState('ErrorAK: $e, $stack'));
      rethrow;
    }
  }
}
