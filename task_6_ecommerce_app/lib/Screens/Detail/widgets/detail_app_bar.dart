// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:task_6_ecommerce_app/my_models/product_model.dart';

// class DetailAppBar extends ConsumerWidget {
//   final Product product;
//   const DetailAppBar({super.key, required this.product});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final favoriteProvider = ref.watch(favoriteProvider.notifier);

//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Row(
//         children: [
//           IconButton(
//             style: IconButton.styleFrom(
//               backgroundColor: Colors.white,
//               padding: const EdgeInsets.all(15),
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back_ios),
//           ),
//           const Spacer(),
//           IconButton(
//             style: IconButton.styleFrom(
//               backgroundColor: Colors.white,
//               padding: const EdgeInsets.all(15),
//             ),
//             onPressed: () {},
//             icon: const Icon(Icons.share_outlined),
//           ),
//           const SizedBox(width: 10),
//           IconButton(
//             style: IconButton.styleFrom(
//               backgroundColor: Colors.white,
//               padding: const EdgeInsets.all(15),
//             ),
//             onPressed: () {
//               favoriteProvider.toggleFavorite(product);
//             },
//             icon: Icon(
//               ref.watch(favoriteProvider).contains(product)
//                   ? Icons.favorite
//                   : Icons.favorite_border,
//               color: Colors.black,
//               size: 25,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_6_ecommerce_app/my_models/product_model.dart';

// Define a provider for managing favorites
final favoriteProvider = StateNotifierProvider<FavoriteNotifier, Set<Product>>(
  (ref) => FavoriteNotifier(),
);

class DetailAppBar extends ConsumerWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the notifier and state from the provider
    final favoriteNotifier = ref.watch(favoriteProvider.notifier);
    final favoriteProducts = ref.watch(favoriteProvider);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
          const SizedBox(width: 10),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              favoriteNotifier.toggleFavorite(product);
            },
            icon: Icon(
              favoriteProducts.contains(product)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

// Define the FavoriteNotifier class
class FavoriteNotifier extends StateNotifier<Set<Product>> {
  FavoriteNotifier() : super({});

  void toggleFavorite(Product product) {
    if (state.contains(product)) {
      state = {...state}..remove(product);
    } else {
      state = {...state, product};
    }
  }
}
