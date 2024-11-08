import 'dart:io';

import 'package:e_commerce/controller/profile_controller.dart';
import 'package:e_commerce/views/widgets_common/bg_widget.dart';
import 'package:e_commerce/views/widgets_common/custom_textfield.dart';
import 'package:e_commerce/views/widgets_common/our_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/consts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return BgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(()=>
         Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.profileImgPath.isEmpty
                ? Image.asset(
                    imgProfile,
                    width: 120,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                : Image.file(File(controller.profileImgPath.value),width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ourButton(
                color: redColor,
                onPress: () {
                  controller.changeImage(context);
                },
                textColor: whiteColor,
                title: "Change"),
            const Divider(),
            20.heightBox,
            customTextField(hint: namehint, title: name, isPass: false),
            customTextField(hint: passwordhint, title: password, isPass: true),
            20.heightBox,
            SizedBox(
              width: context.screenWidth - 60,
              child: ourButton(
                  color: redColor,
                  onPress: () {},
                  textColor: whiteColor,
                  title: "Save"),
            ),
          ],
        )
            .box
            .white
            .shadowSm
            .padding(EdgeInsets.all(16))
            .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    ));
  }
}
