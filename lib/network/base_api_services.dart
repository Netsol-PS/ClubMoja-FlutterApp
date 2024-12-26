import 'package:demo/repository/repo_imp/api_repo_imp.dart';
import 'package:dio/dio.dart';

import '../core/di/injector.dart';

class BaseApiServices extends ApiRepoImpl {
  final Dio _dio = getIt<Dio>();

  Future<dynamic> getApi<T>(String url) {
    return _dio.get(url);
  }
}
