import 'dart:async';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading =false.obs;

//text controller
  var emailController =TextEditingController();
  var passwordController =TextEditingController();

  //login menthod
  Future<UserCredential?> loginMenthod({ context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //signup menthod
  Future<UserCredential?> signupMenthod ({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storting data menthod
storeUserData({name,password,email})async{
    DocumentReference store =await firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      "name":name,
      "password":password,
      "email":email,
      "imageUrl":'',
      "id":currentUser!.uid,
    });
}

//signout menthod
signoutMenthod(context)async{
    try{
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
}
}
