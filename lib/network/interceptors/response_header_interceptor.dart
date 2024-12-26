import 'package:demo/network/api_config.dart';
import 'package:dio/dio.dart';

import '../../helpers/session_manager.dart';


class ResponseHeaderInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Check if the request was successful
    if (response.statusCode == 200) {
      // If request is login or register, save tokens from response headers
      if (response.requestOptions.path.contains(ApiConfig.LOGIN) ||
          response.requestOptions.path.contains(ApiConfig.REGISTER_RIDER)) {
        var headers = response.headers;

        // Extract tokens and store them in session manager
        if (headers.value('x-access-token') != null) {
          SessionManager.accessToken = headers.value('x-access-token')!;
        }
        if (headers.value('x-refresh-token') != null) {
          SessionManager.refreshToken = headers.value('x-refresh-token')!;
        }
      }
    } else {
      // Handle unsuccessful response
      print("Response error: ${response.statusCode}");
    }

    handler.next(response); // Continue with the response
  }
}
