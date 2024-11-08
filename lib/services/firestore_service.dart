import 'package:e_commerce/consts/consts.dart';

class FirestoreServices{
  //get user data
  static getUser(uid){
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }
}