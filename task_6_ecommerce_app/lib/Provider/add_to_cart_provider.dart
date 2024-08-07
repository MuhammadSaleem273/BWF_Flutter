import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_6_ecommerce_app/my_models/product_model.dart'; // Adjust path as necessary

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    final existingItemIndex = state.indexWhere((item) => item.product == product);
    
    if (existingItemIndex != -1) {
      // If product is already in the cart, increment its quantity
      final existingItem = state[existingItemIndex];
      state[existingItemIndex] = CartItem(product: existingItem.product, quantity: existingItem.quantity + 1);
    } else {
      // If product is not in the cart, add it
      state = [...state, CartItem(product: product, quantity: 1)];
    }
    // Trigger state update
    state = [...state];
  }

  void removeFromCart(int index) {
    state = [...state]..removeAt(index);
  }

  void incrementQtn(int index) {
    state[index] = CartItem(product: state[index].product, quantity: state[index].quantity + 1);
    state = [...state];
  }

  void decrementQtn(int index) {
    if (state[index].quantity > 1) {
      state[index] = CartItem(product: state[index].product, quantity: state[index].quantity - 1);
      state = [...state];
    }
  }

  void updateQuantity(Product product, int newQuantity) {
    final existingItemIndex = state.indexWhere((item) => item.product == product);

    if (existingItemIndex != -1) {
      if (newQuantity > 0) {
        state[existingItemIndex] = CartItem(product: state[existingItemIndex].product, quantity: newQuantity);
      } else {
        state = [...state]..removeAt(existingItemIndex);
      }
      state = [...state];
    }
  }

  List<CartItem> get cartItems => state;

  double totalPrice() {
    return state.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
  (ref) => CartNotifier(),
);
