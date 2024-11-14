import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/controller/home_controller.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
class ChatsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getChatId();
    super.onInit();
  }



  var chats = firestore.collection(chatsCollection);
  var friendName = Get.arguments[0];
  var friendId = Get.arguments[1];
  var senderName = Get.find<HomeController>().username;
  var currentId = currentUser!.uid;
  var msgController = TextEditingController();
  dynamic chatDocId;

  var isLoading=false.obs;

  getChatId() async {
    await chats
        .where('users', isEqualTo: {friendId: null, currentId: null})
        .limit(1)
        .get()
        .then((QuerySnapshot snapshot) {
          if (snapshot.docs.isNotEmpty) {
            chatDocId = snapshot.docs.single.id;
          } else {
            chats.add({
              //moi them vaorommid
              'roomId': '',

              'created_on':null,
              'last_msg':'',
              'users':{friendId: null, currentId: null},
              'toId':'',
              'fromId':'',
              'friend_name':friendName,
              'sender_name':senderName,


            }).then((value){
              {chatDocId=value.id;}
            });
          }
        });
    isLoading(false);
  }

  //gui tinnhan
  sendMsg (String msg)async{
    if(msg.trim().isNotEmpty){
      chats.doc(chatDocId).update({
        'created_on':FieldValue.serverTimestamp(),
        'roomId': chatRoomId(friendId.toString(),currentId.toString()),
        'last_msg':msg,
        'toId':friendId,
        'fromId':currentId,
      });
      chats.doc(chatDocId).collection(messagesCollection).doc().set({
        'created_on':FieldValue.serverTimestamp(),
        'msg':msg,
        'uid':currentId,
      });
    }
  }

  // tao chuoi
  String chatRoomId(String user1, String user2) {
    List<String> users = [user1, user2];
    users.sort(); // Sắp xếp danh sách users
    String combined = users.join("-");
    var bytes = utf8.encode(combined);
    var digest = sha1.convert(bytes);
    return digest.toString();
  }
}
