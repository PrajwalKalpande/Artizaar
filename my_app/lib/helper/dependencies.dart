import 'package:get/get.dart';
import 'package:my_app/controllers/artworks_for_sell_controller.dart';
import 'package:my_app/controllers/cart_controller.dart';
import 'package:my_app/data/api/api_client.dart';
import 'package:my_app/data/repository/artworks_for_sell_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repository/cart_repo.dart';
import '../utils/appconstants.dart';
Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //api clients
  Get.lazyPut(() => ApiClient(appBaseURL:AppConstants.BASEURL));
//repos 
  Get.lazyPut(() => ArtworksforSellRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find() ));
//controllers
  Get.lazyPut(() => ArtworksforSellController(artworksRepo: Get.find()));
  Get.lazyPut(()=> CartController(cartRepo: Get.find()));
  print("hi");
}
