
import 'package:flutter/material.dart';
import 'package:task_6_ecommerce_app/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            style: IconButton.styleFrom(
                backgroundColor: kcontentColor,
                padding: const EdgeInsets.all(20)),
            onPressed: () {},
            icon: Image.asset(
              'images/icon.png',
              height: 10,
              // width: 15,
            )),
        IconButton(
            style: IconButton.styleFrom(
                backgroundColor: kcontentColor,
                padding: const EdgeInsets.all(20)),
            onPressed: () {},
            iconSize: 10,
            icon: const Icon(Icons.notifications_outlined),)
      ],
    );
  }
}
