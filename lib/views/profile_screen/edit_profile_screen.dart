import 'package:e_commerce/views/widgets_common/bg_widget.dart';
import 'package:e_commerce/views/widgets_common/custom_textfield.dart';
import 'package:e_commerce/views/widgets_common/our_button.dart';

import '../../consts/consts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imgProfile,
            width: 120,
            fit: BoxFit.cover,
          ).box.roundedFull.clip(Clip.antiAlias).make(),
          10.heightBox,
          ourButton(
              color: redColor,
              onPress: () {},
              textColor: whiteColor,
              title: "Change"),
          const Divider(),
          20.heightBox,
          customTextField(hint: namehint, title: name, isPass: false),
          customTextField(hint: passwordhint, title: password, isPass: true),
          20.heightBox,
          SizedBox(
            width: context.screenWidth-60,
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
    ));
  }
}
