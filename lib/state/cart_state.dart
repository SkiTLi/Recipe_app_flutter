import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/cart.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/providers/cart_provider.dart';

class CartCubit extends Cubit<Cart> {
  final _cartProvider = CartProvider();

  CartCubit() : super(Cart([]));

  void addIngredient(Ingredient ingredient) async {
    final cart = await _cartProvider.addIngredient(ingredient);
    emit(cart);
  }

  void removeIngredient(Ingredient ingredient) async {
    final cart = await _cartProvider.removeIngredient(ingredient);
    emit(cart);
  }
}
