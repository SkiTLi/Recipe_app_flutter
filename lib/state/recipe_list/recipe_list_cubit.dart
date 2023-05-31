
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/state/recipe_list/recipe_list_state.dart';

class RecipeListCubit extends Cubit<RecipeListState> {
  final _recipeProvider = RecipeProvider();

  RecipeListCubit() : super(RecipeListLoadingState()) {
    // _load();
  }

}
