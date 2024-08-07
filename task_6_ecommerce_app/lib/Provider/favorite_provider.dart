import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_6_ecommerce_app/my_models/product_model.dart'; // Adjust path as necessary

// StateNotifier to manage favorite products
class FavoriteNotifier extends StateNotifier<List<Product>> {
  FavoriteNotifier() : super([]);

  void toggleFavorite(Product product) {
    if (state.contains(product)) {
      state = state.where((item) => item != product).toList();
    } else {
      state = [...state, product];
    }
  }

  List<Product> get favorites => state;
}

// Provider for favorite products
final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<Product>>(
  (ref) => FavoriteNotifier(),
);
