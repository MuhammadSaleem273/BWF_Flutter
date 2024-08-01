import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_6_ecommerce_app/my_models/product_model.dart';



class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;
  void toggleFavorite(Product product) {
   

    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

// for increment
  incrementQtn(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  // for decrement
  decrementQtn(int index) {
    if (_cart[index].quantity <= 1) {
      return;
    }
    _cart[index].quantity--;
    notifyListeners();
  }

  // for total amount
  totalPrice() {
    double myTotal = 0.0; // initial
    for (Product element in _cart) {
      myTotal += element.price * element.quantity;
    }
    return myTotal;
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
