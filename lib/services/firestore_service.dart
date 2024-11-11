import 'package:e_commerce/consts/consts.dart';

class FirestoreServices{
  //get user data
  static getUser(uid){
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }

  //lấy sp trong category
static getProducts(category){
    return firestore.collection(productsCollection).where ('p_category',isEqualTo: category).snapshots();
}
}