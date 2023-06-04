import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/state/category_list/category_list_state.dart';

class CategoryListCubit extends Cubit<CategoryListState> {
  final _recipeProvider = RecipeProvider();

  CategoryListCubit() : super(CategoryListLoadingState()) {
    _loadCategories();
  }

  void _completeLoading(List<Category> categories) {
    if (categories.isEmpty) {
      emit(CategoryListEmptyState());

      return;
    }
    emit(CategoryListLoadedState(categories));
  }

  void _loadCategories() async {
    try {
      final categories = await _recipeProvider.getAllCategories();
      _completeLoading(categories);
      emit(CategoryListLoadedState(categories));

    } catch (e, stack) {
      emit(CategoryListErrorState('ErrorAK: $e, $stack'));
      rethrow;
    }
  }
}
