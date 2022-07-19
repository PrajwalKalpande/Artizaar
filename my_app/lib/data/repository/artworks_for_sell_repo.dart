import 'package:get/get.dart';
import '../api/api_client.dart';

class ArtworksforSellRepo extends GetxService {
  final ApiClient apiClient;
  ArtworksforSellRepo({required this.apiClient});
  Future<Response> getArtwork() async{
    return await apiClient.getData("/api/artwork");
  }
  Future<Response> getPopularArtworks()async{
      return await apiClient.getData("/api/popularArtworks");
  }
}
