// // providers.dart
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:task_6_ecommerce_app/my_models/product_model.dart';

// class CartNotifier extends StateNotifier<List<Product>> {
//   CartNotifier() : super([]);

//   void addToCart(Product product) {
//     state = [...state, product];
//   }

//   void removeFromCart(int index) {
//     state = [...state]..removeAt(index);
//   }

//   void incrementQtn(int index) {
//     state = [
//       for (int i = 0; i < state.length; i++)
//         if (i == index)
//           state[i].copyWith(quantity: state[i].quantity + 1)
//         else
//           state[i]
//     ];
//   }

//   void decrementQtn(int index) {
//     if (state[index].quantity > 1) {
//       state = [
//         for (int i = 0; i < state.length; i++)
//           if (i == index)
//             state[i].copyWith(quantity: state[i].quantity - 1)
//           else
//             state[i]
//       ];
//     }
//   }

//   double totalPrice() {
//     return state.fold(0, (sum, item) => sum + item.price * item.quantity);
//   }
// }

// final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
//   return CartNotifier();
// });

// class FavoriteNotifier extends StateNotifier<List<Product>> {
//   FavoriteNotifier() : super([]);

//   void toggleFavorite(Product product) {
//     if (state.contains(product)) {
//       state = [...state]..remove(product);
//     } else {
//       state = [...state, product];
//     }
//   }

//   bool isExist(Product product) {
//     return state.contains(product);
//   }
// }

// final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<Product>>((ref) {
//   return FavoriteNotifier();
// });
