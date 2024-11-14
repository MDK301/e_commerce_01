import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/views/orders_screen/order_place_details.dart';
import 'package:e_commerce/views/orders_screen/order_status.dart';
import 'package:intl/intl.dart' as intl;

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key, this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Column(
        children: [
          orderStatus(
              color: redColor,
              icon: Icons.done,
              title: "Placed",
              showDone: data['order_placed']),
          orderStatus(
              color: Colors.blue,
              icon: Icons.thumb_up,
              title: "Confirmed",
              showDone: data['order_confirmed']),
          orderStatus(
              color: Colors.yellow,
              icon: Icons.car_crash,
              title: "On Delivery",
              showDone: data['order_delivery']),
          orderStatus(
              color: Colors.purple,
              icon: Icons.done_all_rounded,
              title: "Delivered",
              showDone: data['order_delivered']),
          const Divider(),
          10.heightBox,
          orderPlaceDetails(
              d1: data['order_code'],
              d2: data['shipping_method'],
              title1: "Order Code",
              title2: "Shipping Method"),
          orderPlaceDetails(
              d1: intl.DateFormat()
                  .add_yMd()
                  .format(data['order_date'].toDate()),
              d2: data['payment_method'],
              title1: "Order Code",
              title2: "Payment Method"),
          orderPlaceDetails(
              d1: "Unpaid",
              d2: "Order Placed",
              title1: "Payment Status",
              title2: "Delivery Status"),
        ],
      ),
    );
  }
}
