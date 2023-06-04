import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/state/ingredient_list/ingredient_list_state.dart';

class IngredientListCubit extends Cubit<IngredientListState> {
  final _recipeProvider = RecipeProvider();

  IngredientListCubit() : super(IngredientListLoadingState()) {
    _loadIngredients();
  }

  void _completeLoading(List<Ingredient> ingredient) {
    if (ingredient.isEmpty) {
      emit(IngredientListEmptyState());

      return;
    }
    emit(IngredientListLoadedState(ingredient));
  }

  void _loadIngredients() async {
    try {
      final ingredients = await _recipeProvider.getAllIngredients();
      _completeLoading(ingredients);
      emit(IngredientListLoadedState(ingredients));
    } catch (e, stack) {
      emit(IngredientListErrorState('ErrorAK: $e, $stack'));
      rethrow;
    }
  }
}
