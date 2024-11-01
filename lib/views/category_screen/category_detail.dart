import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/lists.dart';
import 'package:e_commerce/views/category_screen/item_detail.dart';
import 'package:e_commerce/views/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetail extends StatelessWidget {
  final String? title;

  const CategoryDetail({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      6,
                      (index) => "Baby CLothing"
                          .text
                          .size(12)
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .makeCentered()
                          .box
                          .rounded
                          .white
                          .size(120, 60)
                          .margin(EdgeInsets.symmetric(horizontal: 4))
                          .make()),
                ),
              ),

              //item container
              20.heightBox,

              Expanded(
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 12,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 250,
                              mainAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP1,
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            "Laptop 4GB/64GB"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            10.heightBox,
                            "\600"
                                .text
                                .color(redColor)
                                .fontFamily(bold)
                                .size(16)
                                .make(),
                          ],
                        )
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .roundedSM
                            .outerShadowSm
                            .padding(EdgeInsets.all(8))
                            .make().onTap((){
                              Get.to(()=>ItemDetail(title: "Dummy Item"));
                        });
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
