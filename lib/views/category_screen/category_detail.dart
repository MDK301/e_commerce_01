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

class CategoryDetail extends StatefulWidget {
  final String? title;

  const CategoryDetail({Key? key, this.title}) : super(key: key);

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  void initState() {
switchCategory(widget.title);
    super.initState();
  }

  switchCategory(title) {
    if (controller.subcat.contains(title)) {
      productMenthod = FirestoreServices.getSubCategoryProducts(title);
    } else {
      productMenthod = FirestoreServices.getProducts(title);
    }
  }

  var controller = Get.find<ProductController>();
  dynamic productMenthod;

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
          appBar: AppBar(
            title: widget.title!.text.fontFamily(bold).white.make(),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      controller.subcat.length,
                      (index) => "${controller.subcat[index]}"
                              .text
                              .size(12)
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .rounded
                              .white
                              .size(120, 60)
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .make()
                              .onTap(() {
                            switchCategory("${controller.subcat[index]}");
                            setState(() {});
                          })),
                ),
              ),
              20.heightBox,
              StreamBuilder(
                  stream: productMenthod,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                        child: Center(
                          child: loadingIndicator(),
                        ),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Expanded(
                        child: "No products found!".text.color(darkFontGrey).makeCentered(),
                      );
                    } else {
                      var data = snapshot.data!.docs;
                      return

                          //item container

                          Expanded(
                              child: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisExtent: 250,
                                          mainAxisSpacing: 8),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          data[index]['p_imgs'][0],
                                          width: 200,
                                          height: 160,
                                          fit: BoxFit.cover,
                                        ),
                                        "${data[index]['p_name']}"
                                            .text
                                            .fontFamily(semibold)
                                            .color(darkFontGrey)
                                            .make(),
                                        10.heightBox,
                                        "${data[index]['p_price']}"
                                            .numCurrency
                                            .text
                                            .color(redColor)
                                            .fontFamily(bold)
                                            .size(16)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .white
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 4))
                                        .roundedSM
                                        .outerShadowSm
                                        .padding(EdgeInsets.all(8))
                                        .make()
                                        .onTap(() {
                                      controller.checkIfFav(data[index]);
                                      Get.to(
                                        () => ItemDetail(
                                          title: "${data[index]['p_name']}",
                                          data: data[index],
                                        ),
                                      );
                                    });
                                  }));
                    }
                  }),
            ],
          )),
    );
  }
}
