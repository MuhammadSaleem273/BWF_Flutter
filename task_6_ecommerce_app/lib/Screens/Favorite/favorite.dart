import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_6_ecommerce_app/Provider/favorite_provider.dart';
import 'package:task_6_ecommerce_app/constant.dart';
import 'package:task_6_ecommerce_app/my_models/product_model.dart';

class Favorite extends ConsumerWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> finalList = ref.watch(favoriteProvider);

    return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
        backgroundColor: kcontentColor,
        title: const Text(
          "Favorite",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index) {
                final favoriteItem = finalList[index];
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                color: kcontentColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(favoriteItem.image),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favoriteItem.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  favoriteItem.category,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade400,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "\$${favoriteItem.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // For delete button
                    Positioned(
                      top: 40,
                      right: 35,
                      child: GestureDetector(
                        onTap: () {
                          ref.read(favoriteProvider.notifier).toggleFavorite(favoriteItem);
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}




// this is right
// import 'package:flutter/material.dart';
// import 'package:task_6_ecommerce_app/Provider/favorite_provider.dart';
// import 'package:task_6_ecommerce_app/constant.dart';

// class Favorite extends StatefulWidget {
//   const Favorite({super.key});

//   @override
//   State<Favorite> createState() => _FavoriteState();
// }

// class _FavoriteState extends State<Favorite> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = FavoriteProvider.of(context);
//     final finalList = provider.favorites;
//     return Scaffold(
//       backgroundColor: kcontentColor,
//       appBar: AppBar(
//         backgroundColor: kcontentColor,
//         title: const Text(
//           "Favorite",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: ListView.builder(
//                   itemCount: finalList.length,
//                   itemBuilder: (context, index) {
//                     final favoriteItems = finalList[index];
//                     return Stack(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(15),
//                           child: Container(
//                             padding: const EdgeInsets.all(10),
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.white,
//                             ),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(10),
//                                   width: 85,
//                                   height: 85,
//                                   decoration: BoxDecoration(
//                                     color: kcontentColor,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   child: Image.asset(favoriteItems.image),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       favoriteItems.title,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 5),
//                                     Text(
//                                       favoriteItems.category,
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.grey.shade400,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 10),
//                                     Text(
//                                       "\$${favoriteItems.price}",
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         // for delete button
//                         Positioned(
//                           top: 40,right: 35,
//                           child: GestureDetector(
//                             onTap: () {
//                               finalList.removeAt(index);
//                               setState(() {
                                
//                               });
//                             },
//                             child: const Icon(
//                               Icons.delete,
//                               color: Colors.red,
//                               size: 25,
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }))
//         ],
//       ),
//     );
//   }
// }
