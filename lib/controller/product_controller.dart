import 'package:e_commerce/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class ProductController extends GetxController{
  var subcat=[];

  getSubCategories(title) async{
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s = decoded.categories.where((element)=> element.name==title).toList();

    for(var e in s[0].subcategory){
      subcat.add(e);
    }
  }
}