import 'package:e_commerce/consts/consts.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: "Cart is Empty!".text.fontFamily(semibold).size(77).color(darkFontGrey).makeCentered(),
    );
  }
}
