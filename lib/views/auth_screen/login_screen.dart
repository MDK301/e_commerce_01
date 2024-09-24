import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/widgets_common/applogo_widget.dart';
import 'package:e_commerce/widgets_common/bg_widget.dart';
import 'package:e_commerce/widgets_common/custom_textfield.dart';
import 'package:e_commerce/widgets_common/our_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Login to $appname".text.fontFamily(bold).white.size(18).make(),
              10.heightBox,
              Column(
                children: [
                  customTextField(hint: emailhint, title: email),
                  customTextField(hint: passwordhint, title: password),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetPass.text.make())),
                  5.heightBox,
                  // ourButton().box.width(context.screenWidth - 50).make(),
                  ourButton(
                    color: redColor,
                    textColor: whiteColor,
                    title: login,
                    onPress: () {},
                  ).box.width(context.screenWidth - 50).make(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
