import 'package:e_commerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget BgWidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage(imgBackground), fit: BoxFit.fill),
    ),
    child: child,
  );
}