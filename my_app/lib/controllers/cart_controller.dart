 
import 'package:get/get.dart';
import 'package:my_app/data/repository/cart_repo.dart';
import 'package:my_app/models/artwork.dart';
import 'package:my_app/models/cartItem.dart';
import 'package:my_app/utils/appcolors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  
  //allow global access
 Map<String,CartItem> _cartItems = {};
 int _totalItems = 0;
 List<CartItem> _storedItems = [];
 Map<String,CartItem> get cartItems =>_cartItems;
 int get totalItems =>_totalItems;

bool addItem(Artwork artwork, int bid){

  final CartItem item ;
  if(bid<artwork.price!){
      Get.snackbar("Bid Value", "You must bid at a price higher than the Rs."+artwork.price!.toString(),colorText: AppColors.lightPrimary,
      backgroundColor: AppColors.containerColor);
      return false;
  }
  else{

    if(_cartItems.containsKey(artwork.sId)){
      item = _cartItems[artwork.sId]!;
      item.userbid  = bid;
       Get.snackbar("Updating Bid price...", "",colorText: AppColors.lightPrimary,
      backgroundColor: AppColors.containerColor);

  }else{
      _totalItems +=1;
       item= CartItem(cartID: _totalItems,title: artwork.title,username: artwork.username,art:artwork.art,
    createdAt: DateTime.now(),endsOn: artwork.createdAt.toString()+"7days",material: artwork.material,
    details: artwork.details,forSell: artwork.forSell,status: "Bidded",maxbid:artwork.currentbid,userbid: bid,size: artwork.size,
    artworkID:artwork.sId
    );
    
  _cartItems.putIfAbsent(artwork.sId!, (){
 
    return item;});
  }
  cartRepo.saveCartList(_cartItems.values.toList());
  }
  

   

return true;
  
}
set setCart(List<CartItem> items){
  _storedItems = items;
}

List<CartItem> getItems(){
  print( _cartItems.entries.map((item) { return item.value;}).toList());
 return _cartItems.entries.map((item) { return item.value;}).toList();
}
List<CartItem> get storedItems {
  setCart = cartRepo.getCartItems();
  return  _storedItems;
}


}
