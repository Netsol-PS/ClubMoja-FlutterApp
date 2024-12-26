import 'package:demo/network/base_api_services.dart';
import 'package:dio/dio.dart';

class NetworkApiServices extends BaseApiServices {
  Future<Response> getCountries<T>(String url) async {
    return await getApi(url);
  }
}
