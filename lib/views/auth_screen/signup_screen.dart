import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/lists.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets_common/applogo_widget.dart';
import '../widgets_common/bg_widget.dart';
import '../widgets_common/custom_textfield.dart';
import '../widgets_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck=false;

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Sign up to $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextField(hint: namehint, title: name),
                  customTextField(hint: emailhint, title: email),
                  customTextField(hint: passwordhint, title: password),
                  customTextField(hint: passwordhint, title: retypepassword),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetPass.text.make())),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.red,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck=newValue;

                          });
                        },
                      ),
                      10.heightBox,
                      Expanded(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "I agree to the ",
                              style:
                                  TextStyle(fontFamily: bold, color: fontGrey)),
                          TextSpan(
                              text: termandcondition,
                              style:
                                  TextStyle(fontFamily: bold, color: redColor)),
                          TextSpan(
                              text: " & ",
                              style:
                                  TextStyle(fontFamily: bold, color: fontGrey)),
                          TextSpan(
                              text: privacypolicy,
                              style:
                                  TextStyle(fontFamily: bold, color: redColor)),
                        ])),
                      ),
                    ],
                  ),
                  15.heightBox,
                  // ourButton().box.width(context.screenWidth - 50).make(),
                  ourButton(
                    color: redColor,
                    textColor: whiteColor,
                    title: signup,
                    onPress: () {},
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  //warping into gesture detecor of Velocity X
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      alreadyhaveanaccount.text.color(fontGrey).make(),
                      login.text.color(redColor).make().onTap((){
                        Get.back();
                      })
                    ],
                  )
                  // RichText(
                  //   text: const TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: alreadyhaveanaccount,
                  //         style: TextStyle(fontFamily: bold, color: fontGrey),
                  //       ),
                  //       TextSpan(
                  //         text: login,
                  //         style: TextStyle(fontFamily: bold, color: redColor),
                  //       ),
                  //     ],
                  //   ),
                  // ).onTap((){
                  //   Get.back();
                  // })
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
