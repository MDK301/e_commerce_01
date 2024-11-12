import 'package:e_commerce/consts/consts.dart';

class FirestoreServices {
  //get user data
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  //lấy sp trong category
  static getProducts(category) {
    return firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  // lay cho cart
  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

//delete hàng
  static deleteDocument(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

//lay toan bo tin nhan
  static getChatMessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on',descending: true)
        .snapshots();
  }
}
