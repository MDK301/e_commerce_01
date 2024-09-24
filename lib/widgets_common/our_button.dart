import 'package:flutter/material.dart';
import 'package:e_commerce/consts/consts.dart';
export 'package:velocity_x/velocity_x.dart';

Widget ourButton({color ,textColor ,title ,onPress ,}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: () {
        onPress;
      },
  child: VxText(title).color(textColor).fontFamily(bold).make(),
}
