import 'package:get/get.dart';
import '../api/api_client.dart';

class ArtworksforSellRepo extends GetxService {
  final ApiClient apiClient;
  ArtworksforSellRepo({required this.apiClient});
  Future<Response> getArtworks() async{
    return await apiClient.getData("/api/popularArtworks");
  }
}
