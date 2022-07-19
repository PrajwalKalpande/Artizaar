import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_app/models/cartItem.dart';
import 'package:my_app/utils/appconstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_client.dart';

class CartRepo extends GetxService {
  final SharedPreferences sharedPreferences ;
  CartRepo({required this.sharedPreferences});

  List<String> _cart = [];

  void saveCartList(List<CartItem> cartList){
    _cart =[];
    cartList.forEach((item) {   _cart.add(jsonEncode(item));
    return;});
    print("Saving to Local Storage...");
    sharedPreferences.setStringList(AppConstants.CARTLIST, _cart);
    print(sharedPreferences.getStringList(AppConstants.CARTLIST));
  }

  List<CartItem> getCartItems(){
    print('inside');
    List<CartItem> cartList = [];
    List<String> items =[];
    if(sharedPreferences.containsKey(AppConstants.CARTLIST)){items= sharedPreferences.getStringList(AppConstants.CARTLIST)!;}
    items.forEach((item){cartList.add(CartItem.fromJson(jsonDecode(item)));
     
    });
    print(cartList);
       return cartList;
       
  }
  // Future<Response> getCartItems() async{
  //   return await apiClient.vgetData("/api/cartitems");
  // }
  // Future<Response> addToCart()async{
  //     return await apiClient.getData("/api/add/cartitems");
  // }
}
