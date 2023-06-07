import 'package:recipe_app/models/ingredient.dart';

class Cart {
  final List<Ingredient> ingredients;

  Cart(this.ingredients);

  void addIngredient(Ingredient ingredient) {
    if (!ingredients.contains(ingredient)) {
      ingredients.add(ingredient);
    }
  }

  void removeIngredient(Ingredient ingredient) {
    if (ingredients.contains(ingredient)) {
      ingredients.remove(ingredient);
    }
  }

}
