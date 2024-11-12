import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/controller/chat_controller.dart';
import 'package:e_commerce/services/firestore_service.dart';
import 'package:e_commerce/views/splash_screen/loading_indicator.dart';
import 'package:get/get.dart';

import 'component/sennder_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatsController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Title".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(stream: FirestoreServices.getChatMessages(controller.chatDocId.toString()),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                     if(snapshot.hasData){
                       return Center(
                         child: loadingIndicator(),
                       );
                     }else if(snapshot.data!.docs.isEmpty){
                       return Center(
                         child: "Send a messenger...".text.color(darkFontGrey).make(),
                       );
                     }else{
                       return ListView(
                         children: [
                           senderBubble(),
                         ],
                       );
                     }
                    })),
            10.heightBox,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.msgController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: textfieldGrey),
                        ),
                        hintText: "Type a message..."),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.sendMsg(controller.msgController.text);
                    controller.msgController.clear();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: redColor,
                  ),
                ),
              ],
            ).box.height(60).padding(const EdgeInsets.only(bottom: 8)).make()
          ],
        ),
      ),
    );
  }
}
