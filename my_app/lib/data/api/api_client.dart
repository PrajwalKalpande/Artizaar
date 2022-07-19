import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late Map<String, String> _mainheaders;
  late String appBaseURL;
  // late String token;
  ApiClient({required this.appBaseURL}) {
    baseUrl = appBaseURL;
    timeout = Duration(seconds: 30);
    _mainheaders = {
      'Content-type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
     // print(json.decode(response.body));
      return response;

    } catch (e) {
      print("Error occured:"+e.toString());
      return Response(statusCode: 400,statusText: e.toString());
    }
  }
}
