import 'package:flutter/material.dart';
import 'package:flutter_test_tz/core/services/home_services.dart';
import 'package:flutter_test_tz/model/product_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel =[];

   HomeViewModel(){
    getProducts();
  }

  getProducts()async{
    _loading.value = true;
    HomeService().getProducts().then((value) {
      for(int i=0;i<value.length;i++){
        _productModel.add(ProductModel.fromJson(value[i].data()));
       // print(value[i].data());
        _loading.value=false;
      }
      update();
      
    });
 }

 


}