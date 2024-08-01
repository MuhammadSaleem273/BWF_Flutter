// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:task_6_ecommerce_app/my_models/product_model.dart';
// import 'package:task_6_ecommerce_app/Provider/favorite_provider.dart';
// import 'package:task_6_ecommerce_app/Screens/Detail/detail_screen.dart';
// import 'package:task_6_ecommerce_app/constant.dart';

// class ProductCard extends StatelessWidget {
//   final Product product;
//   const ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<FavoriteProvider>(context);

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailScreen(product: product),
//           ),
//         );
//       },
//       child: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 300,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: kcontentColor,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 5),
//                 Center(
//                   child: Hero(
//                     tag: product.image,
//                     child: Image.asset(
//                       product.image,
//                       width: 80,
//                       height: 80,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     product.title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     "\$${product.price}",
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         product.category,
//                         style: const TextStyle(
//                           fontSize: 11,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           provider.isExist(product)
//                               ? Icons.favorite
//                               : Icons.favorite_border,
//                           color: provider.isExist(product)
//                               ? Colors.red
//                               : Colors.grey,
//                         ),
//                         onPressed: () {
//                           provider.toggleFavorite(product);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:task_6_ecommerce_app/Provider/favorite_provider.dart';
import 'package:task_6_ecommerce_app/Screens/Detail/detail_screen.dart';
import 'package:task_6_ecommerce_app/constant.dart';
import 'package:task_6_ecommerce_app/my_models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(product: product),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kcontentColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Center(
                  child: Hero(
                    tag: product.image,
                    child: Image.asset(
                      product.image,
                      width: 150,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Row(
                      children: List.generate(
                        product.colors.length,
                        (index) => Container(
                          width: 18,
                          height: 18,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: product.colors[index],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
              child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 30,
              width: 40,
              decoration: const BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  provider.toggleFavorite(product);
                },
                child: Icon(
                  provider.isExist(product)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
