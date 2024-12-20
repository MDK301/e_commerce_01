import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/controller/auth_controller.dart';
import 'package:e_commerce/controller/profile_controller.dart';
import 'package:e_commerce/services/firestore_service.dart';
import 'package:e_commerce/views/auth_screen/login_screen.dart';
import 'package:e_commerce/views/chat_screen/messaging_screen.dart';
import 'package:e_commerce/views/orders_screen/orders_screen.dart';
import 'package:e_commerce/views/profile_screen/components/detail_card.dart';
import 'package:e_commerce/views/profile_screen/edit_profile_screen.dart';
import 'package:e_commerce/views/splash_screen/loading_indicator.dart';
import 'package:e_commerce/views/widgets_common/bg_widget.dart';
import 'package:e_commerce/views/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/lists.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    FirestoreServices.getCounts();

    return BgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            // print('p1');
            //     print(snapshot.data!.docs);
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              // print('p2');
              // print(snapshot.data!.docs);
              var data =snapshot.data!.docs[0];
//               print("data: ");
//               print(data);
// return Container(child: IconButton(onPressed: (){print(snapshot.data!.docs);}, icon: Icon(Icons.link)),);
              return SafeArea(
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
                        controller.nameController.text=data['name'];
                        Get.to(() =>  EditProfileScreen(data:data));
                      }),
                    ),

                    //user detail profile
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          data['imageUrl']==''?

                          Image.asset(
                            imgProfile,
                            width: 120,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                          :
                          Image.network(
                            data['imageUrl'],
                            width: 120,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),



                          10.widthBox,
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['name']}"
                                  .text
                                  .fontFamily(semibold)
                                  .white
                                  .make(),
                              "${data['email']}".text.white.make(),
                            ],
                          )),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                              color: whiteColor,
                            )),
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signoutMenthod(context);
                              Get.offAll(() =>  LoginScreen());
                            },
                            child: logout.text.fontFamily(semibold).make(),
                          )
                        ],
                      ),
                    ),
                    20.heightBox,
                    FutureBuilder(future: FirestoreServices.getCounts(), builder: (BuildContext context, AsyncSnapshot snapshot){
                      if(!snapshot.hasData){
                        return Center(child: loadingIndicator(),);
                      }else{
                        print(snapshot.data);
                        var countData=snapshot.data;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DetailCard(
                                count: countData[0].toString() ,
                                title: "in your cart",
                                width: context.screenWidth / 3.4),
                            DetailCard(
                                count: countData[1].toString(),
                                title: "in your wishlist",
                                width: context.screenWidth / 3.4),
                            DetailCard(
                                count: countData[2].toString(),
                                title: "your orders",
                                width: context.screenWidth / 3.4),
                          ],
                        );
                      }
                    }),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     DetailCard(
                    //         count: "${data['cart_count']}",
                    //         title: "in your cart",
                    //         width: context.screenWidth / 3.4),
                    //     DetailCard(
                    //         count: "${data['wishlist_count']}",
                    //         title: "in your wishlist",
                    //         width: context.screenWidth / 3.4),
                    //     DetailCard(
                    //         count: "${data['order_count']}",
                    //         title: "your orders",
                    //         width: context.screenWidth / 3.4),
                    //   ],
                    // ),

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
                          onTap: (){
                            switch (index){
                              case 0:
                                Get.to(()=>const OrdersScreen());
                                break;
                              case 1:
                                Get.to(()=>const WishlistScreen());
                                break;
                              case 2:
                                Get.to(()=>const MessagesScreen());
                                break;
                            }
                          },
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
                        .rounded
                        .margin(EdgeInsets.all(12))
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .shadowSm
                        .make()
                        .box
                        .color(redColor)
                        .make(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
