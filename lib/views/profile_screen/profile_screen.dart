import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/controller/auth_controller.dart';
import 'package:e_commerce/views/auth_screen/login_screen.dart';
import 'package:e_commerce/views/profile_screen/components/detail_card.dart';
import 'package:e_commerce/views/profile_screen/edit_profile_screen.dart';
import 'package:e_commerce/views/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/lists.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              //edit profile button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.edit,
                    color: whiteColor,
                  ),
                ).onTap(() {
                  Get.to(()=>const EditProfileScreen());
                }),
              ),

              //user detail profile
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset(
                      imgProfile,
                      width: 120,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dummy User".text.fontFamily(semibold).white.make(),
                        "Customer@example.com".text.white.make(),
                      ],
                    )),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                        color: whiteColor,
                      )),
                      onPressed: () async{
                        await Get.put(AuthController()).signoutMenthod(context);
                        Get.offAll(()=>const LoginScreen());
                      },
                      child: logout.text.fontFamily(semibold).make(),
                    )
                  ],
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DetailCard(
                      count: "00",
                      title: "in your cart",
                      width: context.screenWidth / 3.4),
                  DetailCard(
                      count: "32",
                      title: "in your wishlist",
                      width: context.screenWidth / 3.4),
                  DetailCard(
                      count: "67",
                      title: "your orders",
                      width: context.screenWidth / 3.4),
                ],
              ),

              //Button section
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: lightGrey,
                  );
                },
                itemCount: profileButtonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(
                      profileButtonIcons[index],
                      width: 22,
                    ),
                    title: profileButtonList[index]
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                  );
                },
              )
                  .box
                  .white
                  .rounded.margin(EdgeInsets.all(12))
                  .padding(const EdgeInsets.symmetric(horizontal: 16))
                  .shadowSm
                  .make().box.color(redColor).make(),
            ],
          )),
    ));
  }
}
