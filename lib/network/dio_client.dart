import 'package:demo/network/api_config.dart';
import 'package:dio/dio.dart';

import 'interceptors/network_connector_interceptor.dart';
import 'interceptors/request_header_interceptor.dart';
import 'interceptors/response_header_interceptor.dart';


class DioClient {
  static Dio? _dio;
  static Dio getInstance() {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
        baseUrl: ApiConfig.BASE_URL,  // Set your API base URL
        connectTimeout: const Duration(milliseconds: 5000),  // Set connection timeout
        receiveTimeout: const Duration(milliseconds: 3000),  // Set receiving timeout
      ));

      // Add interceptors
      _dio!.interceptors.add(NetworkConnectorInterceptor());
      _dio!.interceptors.add(RequestHeaderInterceptor());
      _dio!.interceptors.add(ResponseHeaderInterceptor());
    }
    return _dio!;
  }
}

