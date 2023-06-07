import 'package:recipe_app/models/cart.dart';
import 'package:recipe_app/models/ingredient.dart';

class CartProvider {
  Cart _cart = Cart([]);

  Future<Cart> addIngredient(Ingredient ingredient) async {
    if (!_cart.ingredients.contains(ingredient)) {
      _cart = Cart([
        ..._cart.ingredients,
        ingredient,
      ]);
    }
    return _cart;
  }

  Future<Cart> removeIngredient(Ingredient ingredient) async {
    _cart.removeIngredient(ingredient);
    return _cart;
  }

  bool isContainsIngredient(Ingredient ingredient) {
    return _cart.ingredients.contains(ingredient) ? true : false;
  }
}
