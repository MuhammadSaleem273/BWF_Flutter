import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_6_ecommerce_app/Provider/add_to_cart_provider.dart';
import 'package:task_6_ecommerce_app/constant.dart';

class CheckOutBox extends ConsumerWidget {
  const CheckOutBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cartProvider.notifier);
    final totalPrice = provider.totalPrice();

    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              filled: true,
              fillColor: kcontentColor,
              hintText: "Enter Discount Code",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              suffixIcon: TextButton(
                onPressed: () {},
                child: const Text(
                  "Apply",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kprimaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Subtotal",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Text(
                "\$$totalPrice",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "\$$totalPrice",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          MaterialButton(
            minWidth: double.infinity,
            height: 50,
            color: kprimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {},
            child: const Text(
              "Checkout",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// this is right
// import 'package:flutter/material.dart';
// import 'package:task_6_ecommerce_app/Provider/add_to_cart_provider.dart';
// import 'package:task_6_ecommerce_app/constant.dart';

// class CheckOutBox extends StatelessWidget {
//   const CheckOutBox({super.key});


//   @override
//   Widget build(BuildContext context) {
//     final provider = CartProvider.of(context);
//     return Container(
//       height: 300,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(30),
//           bottomLeft: Radius.circular(30),
//         ),
//       ),
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         children: [
//           TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: BorderSide.none,
//               ),
//               contentPadding: const EdgeInsets.symmetric(
//                 vertical: 5,
//                 horizontal: 15,
//               ),
//               filled: true,
//               fillColor: kcontentColor,
//               hintText: "Enter Discoutn Code",
//               hintStyle: const TextStyle(
//                 color: Colors.grey,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//               ),
//               suffixIcon: TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   "Apply",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     color: kprimaryColor,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "SbuTotal",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//                   fontSize: 16,
//                 ),
//               ),
//               Text(
//                 "\$${provider.totalPrice()}",
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(height: 10),
//           const Divider(),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "total",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               Text(
//                 "\$${provider.totalPrice()}",
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: kprimaryColor,
//                 minimumSize: const Size(double.infinity, 55),
//               ),
//               onPressed: () {},
//               child: const Text(
//                 "Check Out",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color: Colors.white,
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
// // now we add the provider and display the total price