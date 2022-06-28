import 'package:get/get.dart';
import 'package:my_app/controllers/artworks_for_sell_controller.dart';
import 'package:my_app/data/api/api_client.dart';
import 'package:my_app/data/repository/artworks_for_sell_repo.dart';

Future<void> init() async {
  print("HI");
  //api clients
  Get.lazyPut(() => ApiClient(appBaseURL: "http://localhost:3000"));
//repos
  Get.lazyPut(() => ArtworksforSellRepo(apiClient: Get.find()));
//controllers
  Get.lazyPut(() => ArtworksforSellController(artworksRepo: Get.find()));
  print("hi");
}
