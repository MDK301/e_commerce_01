import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/lists.dart';
import 'package:e_commerce/controller/product_controller.dart';
import 'package:e_commerce/services/firestore_service.dart';
import 'package:e_commerce/views/category_screen/item_detail.dart';
import 'package:e_commerce/views/splash_screen/loading_indicator.dart';
import 'package:e_commerce/views/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetail extends StatelessWidget {
  final String? title;

  const CategoryDetail({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return BgWidget(
      child: Scaffold(
          appBar: AppBar(
            title: title!.text.fontFamily(bold).white.make(),
          ),
          body: StreamBuilder(
              stream: FirestoreServices.getProducts(title),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if(!snapshot.hasData){
                  return Center(
                    child: loadingIndicator(),
                  );
                }
              })),
    );
  }
}
