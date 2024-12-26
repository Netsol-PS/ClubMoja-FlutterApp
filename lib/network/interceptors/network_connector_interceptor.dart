import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
class NetworkConnectorInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      // If no internet connection, return an error response
      return handler.reject(
        DioException(
          requestOptions: options,
          error: 'Internet is Not Available',
          type: DioExceptionType.connectionError,
        ),
      );
    }

    // Proceed with the request if internet is available
    handler.next(options);
  }
}
