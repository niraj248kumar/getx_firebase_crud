import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../ProductModel/product_model.dart';
class UserApiService extends GetxController {
  RxList productsList = <ProductModel>[].obs;
  Future<void> fetchApi()async{
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode ==200){
      List<dynamic> result = jsonDecode(response.body);
      productsList.value = result.map((e) => ProductModel.fromJson(e),).toList();
      print("$result");
    }
  }

}