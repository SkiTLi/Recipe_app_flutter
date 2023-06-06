import 'package:recipe_app/models/recipe.dart';

abstract class RecipeListState {}

class RecipeListLoadingState extends RecipeListState {}

class RecipeListEmptyState extends RecipeListState {}

class RecipeListLoadedState extends RecipeListState {
  final List<Recipe> recipes;

  RecipeListLoadedState(this.recipes);
}

class RecipeListErrorState extends RecipeListState {
  final String errorText;

  RecipeListErrorState(this.errorText);
}
