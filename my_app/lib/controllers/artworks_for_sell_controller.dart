import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_app/data/repository/artworks_for_sell_repo.dart';
import 'package:my_app/models/artwork.dart';

class ArtworksforSellController extends GetxController {
  final ArtworksforSellRepo artworksRepo;
  ArtworksforSellController({required this.artworksRepo});
  dynamic _art ;
  //allow global access
  final List<Artwork> _popularArtworks = [];
  Artwork get newArtwork => _art;
  List<Artwork> get popularArtworks => _popularArtworks;

  Future<void> getArtwork() async {
    try {
      Response response = await artworksRepo.getArtwork();
    if ( response.statusCode==200) {
      // _artworksList = [];
      // (response.body as List).forEach((art)=>{_artworksList.add(Artwork.fromJson(art))});
     _art =  (Artwork.fromJson(response.body));
       print(_art.price);
     
      update();
    } else {
      print("Error error retrieving data");
    }
    } catch (e) {
     print(e);
    }
  }

  Future<void> getPopularArtworksList() async{
    try {
      Response response = await artworksRepo.getPopularArtworks();
    if(response.statusCode==200){
        
    (response.body as List).forEach((art)=>{_popularArtworks.add(Artwork.fromJson(art))});
    print(_popularArtworks);
    update();
    }
    else{
        print("Error error retrieving data");
    }
    } catch (e) {
      print(e);
    }
  }
}
