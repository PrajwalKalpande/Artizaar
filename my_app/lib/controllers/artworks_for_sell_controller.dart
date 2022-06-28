import 'package:get/get.dart';
import 'package:my_app/data/repository/artworks_for_sell_repo.dart';
import 'package:my_app/models/artwork.dart';

class ArtworksforSellController extends GetxController {
  final ArtworksforSellRepo artworksRepo;
  ArtworksforSellController({required this.artworksRepo});
  List<dynamic> _artworksList = [];
  //allow global access
  List<dynamic> get() => _artworksList;

  Future<void> getArtworksList() async {
    Response response = await artworksRepo.getArtworks();
    if (!response.hasError) {
      _artworksList = [];
      (response.body as List).forEach((art)=>{_artworksList.add(ArtworkModel.fromJson(art))});
      update();
    } else {}
  }
}
