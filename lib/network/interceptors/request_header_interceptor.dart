import 'package:demo/network/api_config.dart';
import 'package:dio/dio.dart';
import '../../helpers/session_manager.dart';

class RequestHeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add default headers
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept-Language'] = 'en-GB,en-US;q=0.9,en;q=0.8';

    // Check if request path matches, if not, add Authorization header
    if (!options.path.contains(ApiConfig.GET_CITIES) &&
        !options.path.contains(ApiConfig.LOGIN) &&
        !options.path.contains(ApiConfig.GET_COUNTRIES) &&
        !options.path.contains(ApiConfig.SEND_OTP) &&
        !options.path.contains(ApiConfig.REGISTER_RIDER) &&
        !options.path.contains(ApiConfig.VERIFY_USER_CHECK) &&
        !options.path.contains(ApiConfig.VERIFY_OTP)) {
      options.headers['Authorization'] = 'Bearer ${SessionManager.accessToken}';
    }

    handler.next(options);
  }
}
