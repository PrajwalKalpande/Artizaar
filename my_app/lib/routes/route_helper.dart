import 'package:get/get.dart';
import 'package:my_app/pages/art/display_art_sell.dart';
import 'package:my_app/pages/cart/cart_page.dart';
import 'package:my_app/pages/home/market.dart';

class RouteHelper{
  static const initial = "/";
  static const popularArtwork = "/popular-artwork";
  static const cart = "/cart";
  static String  getPopularArtwork(int index){
    
    return (popularArtwork+'?index=$index');}

  static List<GetPage> routes = [GetPage(name: initial, page:(){return Market(); }),
  GetPage(name: popularArtwork, page: (){
   var index =int.parse(Get.parameters['index']!);
    
   return DisplayArtSell(index:index);},transition:Transition.fadeIn),
   GetPage(name: cart, page: (){
    return CartScreen();},    transition:Transition.fadeIn)];

}