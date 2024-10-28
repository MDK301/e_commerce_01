import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/lists.dart';
import 'package:e_commerce/views/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatelessWidget {
  final String? title;
  const CategoryDetail({Key? key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
      )
    );
  }
}
