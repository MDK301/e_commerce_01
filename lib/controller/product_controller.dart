import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class ProductController extends GetxController{
  var quantity = 0.obs;
  var subcat=[];
  var colorIndex=0.obs;
  var totalPrice=0.obs;

  getSubCategories(title) async{
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s = decoded.categories.where((element)=> element.name==title).toList();

    for(var e in s[0].subcategory){
      subcat.add(e);
    }
  }
  changeColorIndex(index){
    colorIndex.value=index;
  }
  increaseQuantity(totalQuantity){
    if(quantity.value<totalQuantity){
    quantity.value++;}
  }
  decreaseQuantity(){
    if(quantity.value >0){
    quantity.value--;}
  }
  calculateTotalPrice(price){
    totalPrice.value=price*quantity.value;
  }

  addToCart ({title,img,sellername,color,qty,tprice,context})async {
    await firestore.collection(cartCollection).doc().set({
      'title':title,
      'img':img,
      'sellername':sellername,
      'color':color,
      'qty':qty,
      'tprice':tprice,
      'added_by':currentUser!.uid,
    }).catchError((error){
      VxToast.show(context, msg: error.toString());
    });
  }
  resetValue(){
   totalPrice.value=0;
   quantity.value=0;
   colorIndex.value=0;
  }



}