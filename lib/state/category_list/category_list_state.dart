import 'package:recipe_app/models/category.dart';

abstract class CategoryListState {}

class CategoryListLoadingState extends CategoryListState {}

class CategoryListEmptyState extends CategoryListState {}

class CategoryListLoadedState extends CategoryListState {
  final List<Category> categories;

  CategoryListLoadedState(this.categories);
}

class CategoryListErrorState extends CategoryListState {
  final String errorText;

  CategoryListErrorState(this.errorText);
}
