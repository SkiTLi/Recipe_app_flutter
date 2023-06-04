import 'package:recipe_app/models/ingredient.dart';

abstract class IngredientListState {}

class IngredientListLoadingState extends IngredientListState {}

class IngredientListEmptyState extends IngredientListState {}

class IngredientListLoadedState extends IngredientListState {
  final List<Ingredient> ingredients;

  IngredientListLoadedState(this.ingredients);
}

class IngredientListErrorState extends IngredientListState {
  final String errorText;

  IngredientListErrorState(this.errorText);
}
