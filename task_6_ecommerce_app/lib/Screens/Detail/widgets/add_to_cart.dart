import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_6_ecommerce_app/Provider/add_to_cart_provider.dart';
import 'package:task_6_ecommerce_app/my_models/product_model.dart';
import 'package:task_6_ecommerce_app/constant.dart';

class AddToCart extends ConsumerWidget {
  final Product product;
  const AddToCart({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartProvider.notifier);
    // ignore: unrelated_type_equality_checks
    int quantity = ref.watch(cartProvider).indexWhere((item) => item == product) != -1
        // ignore: unrelated_type_equality_checks
        ? ref.watch(cartProvider)[ref.watch(cartProvider).indexWhere((item) => item == product)].quantity
        : 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        quantity--;
                        ref.read(cartProvider.notifier).updateQuantity(product, quantity);
                      }
                    },
                    iconSize: 18,
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      quantity++;
                      ref.read(cartProvider.notifier).updateQuantity(product, quantity);
                    },
                    iconSize: 18,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                cartNotifier.addToCart(product);

                const snackBar = SnackBar(
                  content: Text(
                    "Successfully added!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                height: 50,
                width: 190,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
