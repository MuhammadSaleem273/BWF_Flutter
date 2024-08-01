// import 'package:flutter/material.dart';
// import 'package:task_6_ecommerce_app/Screens/Home_Screens/widget/category.dart';
// import 'package:task_6_ecommerce_app/Screens/Home_Screens/widget/home_appbar.dart';
// import 'package:task_6_ecommerce_app/Screens/Home_Screens/widget/image_slider.dart';
// import 'package:task_6_ecommerce_app/Screens/Home_Screens/widget/product_cart.dart';
// import 'package:task_6_ecommerce_app/Screens/Home_Screens/widget/searchbar.dart';
// import 'package:task_6_ecommerce_app/my_models/product_model.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int currentSlider = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   title: const Text('Home Screen'),
//       // ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 5,
//               ),
//               // For Curtom AppBar
//               const CustomAppBar(),
//               const SizedBox(
//                 height: 8,
//               ),
//               // For search bar
//               const MySearchBAR(),
//               const SizedBox(
//                 height: 8,
//               ),
//               ImageSlider(
//                   currentSlide: currentSlider,
//                   onChange: (value) {
//                     setState(() {
//                       currentSlider = value;
//                     });
//                   }),
//               const SizedBox(
//                 height: 8,
//               ),
//               // for catogory selection
//               const Categories(),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Special For You',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
//                   ),
//                   Text(
//                     'See All',
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w300,
//                         color: Colors.black54),
//                   ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 8,
//               // ),
//               // For shoping items
//               GridView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.78,
//                       crossAxisSpacing: 15,mainAxisSpacing: 15
//                       ),
//                   itemCount: allProducts.length,
//                   itemBuilder: (context, index) {
//                     return ProductCard(
//                       product: allProducts[index],
//                     );
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:task_6_ecommerce_app/Screens/Home_Screens/widget/home_appbar.dart';
import 'package:task_6_ecommerce_app/Screens/Home_Screens/widget/product_cart.dart';
import 'package:task_6_ecommerce_app/Screens/Home_Screens/widget/searchbar.dart';
import 'package:task_6_ecommerce_app/my_models/category.dart';
import 'package:task_6_ecommerce_app/my_models/product_model.dart';


import 'Widget/image_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectcategories = [
      allProducts,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              // for custom appbar
              const CustomAppBar(),
              const SizedBox(height: 20),
              // for search bar
              const MySearchBAR(),
              const SizedBox(height: 20),
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(
                    () {
                      currentSlider = value;
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              // for category selection
              categoryItems(),

              const SizedBox(height: 20),
              if (selectedIndex == 0)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special For You",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              // for shopping items
              const SizedBox(height: 10),
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: selectcategories[selectedIndex].length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: selectcategories[selectedIndex][index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox categoryItems() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectedIndex == index
                    ? Colors.blue[200]
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(categoriesList[index].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    categoriesList[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
