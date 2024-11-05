import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/views/profile_screen/components/detail_card.dart';
import 'package:e_commerce/views/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';

import '../../consts/lists.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            //edit profile button
            const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.edit,
                color: whiteColor,
              ),
            ).onTap(() {}),

            //user detail profile
            Row(
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
                  onPressed: () {},
                  child: logout.text.fontFamily(semibold).make(),
                )
              ],
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
            40.heightBox,
            ListView.separated(
              shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const Divider(color: lightGrey,);
                },
                itemCount: profileButtonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(profileButtonIcons[index]),
                    title: profileButtonList[index].text.make(),
                  );
                },
            ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make(),
          ],
        ),
      )),
    ));
  }
}
