import 'package:dio/dio.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeProvider {
  final _http = Dio(BaseOptions(
    baseUrl: "https://themealdb.com/api/json/v1/1",
  ));

  RecipeProvider() {
    _http.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      responseHeader: true,
      requestHeader: true,
    ));
  }

  Future<List<Ingredient>> getAllIngredients() async {
    final response = await _http.get<Map<String, dynamic>>('/list.php?i=list');

    return (response.data?['meals'] as List)
            .map((ingredientJson) => Ingredient.fromJson(ingredientJson))
            .toList() ??
        [];
  }

  Future<List<Recipe>> getRecipesByMainIngredient(String ingredientName) async {
    final response = await _http.get<Map<String, dynamic>>('/filter.php?i=$ingredientName');

    return (response.data?['meals'] as List)
            .map((recipeJson) => Recipe.fromJson(recipeJson))
            .toList() ??
        [];
  }

  Future<List<Recipe>> getRecipesByCategory(String category) async {
    final response =
        await _http.get<Map<String, dynamic>>('/filter.php?c=$category');

    return (response.data?['meals'] as List)
            .map(
                (recipeJson) => Recipe.fromJson(recipeJson))
            .toList() ??
        [];
  }

  Future<List<Recipe>> getRandomRecipe() async {
    final response = await _http.get<Map<String, dynamic>>('/random.php');

    return (response.data?['meals'] as List)
            .map((recipeJson) => Recipe.fromJson(recipeJson))
            .toList() ??
        [];
  }

  Future<List<Category>> getAllCategories() async {
    final response = await _http.get<Map<String, dynamic>>('/categories.php');

    return (response.data?['categories'] as List)
            .map((categoryJson) => Category.fromJson(categoryJson))
            .toList() ??
        [];
  }
}
