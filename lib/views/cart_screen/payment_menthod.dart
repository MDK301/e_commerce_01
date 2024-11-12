import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/lists.dart';
import 'package:e_commerce/controller/cart_controller.dart';
import 'package:get/get.dart';

import '../widgets_common/our_button.dart';

class PaymentMenthod extends StatelessWidget {
  const PaymentMenthod({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<CartController>();

    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
            onPress: () {},
            color: redColor,
            textColor: whiteColor,
            title: "Place my order"),
      ),
      appBar: AppBar(
        title: "Choose Payment Method"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: List.generate(paymentMenthods.length, (index) {
            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, color: redColor, width: 4)),
              margin: const EdgeInsets.only(bottom: 8),
              child: Stack(
                alignment: Alignment.topRight,
                children: [

                  Image.asset(
                    paymentMenthodsImg[index],
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      activeColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        value: true,
                        onChanged: (value) {}),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}