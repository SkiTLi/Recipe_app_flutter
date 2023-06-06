import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/state/recipe_list/recipe_random_list_state.dart';

enum LoadMethod {
  category, // 1
  ingredient // 2
}

class RecipeListByCubit extends Cubit<RecipeListState> {
  final LoadMethod load;
  final String byThisItem;
  final _recipeProvider = RecipeProvider();

  RecipeListByCubit({
    required this.load,
    required this.byThisItem,
  }) : super(RecipeListLoadingState()) {
    switch (load) {
      case LoadMethod.category:
        _loadRecipesByCategory(byThisItem);
        break;
      case LoadMethod.ingredient:
        _loadRecipesByMainIngredient(byThisItem);
        break;
      default:
        _loadRecipesByCategory("Beef");
    }
  }

  void _completeLoading(List<Recipe> recipes) {
    if (recipes.isEmpty) {
      emit(RecipeListEmptyState());

      return;
    }
    emit(RecipeListLoadedState(recipes));
  }

  void _loadRecipesByCategory(String category) async {
    try {
      final recipes = await _recipeProvider.getRecipesByCategory(category);
      _completeLoading(recipes);

      emit(RecipeListLoadedState(recipes));
    } catch (e, stack) {
      emit(RecipeListErrorState('ErrorAK: $e, $stack'));
      rethrow;
    }
  }

  void _loadRecipesByMainIngredient(String ingredient) async {
    try {
      final recipes =
          await _recipeProvider.getRecipesByMainIngredient(ingredient);
      _completeLoading(recipes);

      emit(RecipeListLoadedState(recipes));
    } catch (e, stack) {
      emit(RecipeListErrorState('ErrorAK: $e, $stack'));
      rethrow;
    }
  }
}
