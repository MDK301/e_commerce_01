import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/services/firestore_service.dart';
import 'package:e_commerce/views/splash_screen/loading_indicator.dart';

import '../../consts/consts.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Wishlist".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getWishlist() ,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return "No orders yet!".text.color(darkFontGrey).makeCentered();
            } else {
              return Container();
            }
          }),
    );
  }
}
