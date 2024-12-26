import 'package:dio/dio.dart';

import '../../data/models/responses/api_response.dart';
abstract class ApiRepo {
  Future<IResponse<T>> handleRequest<T>(Future<Response<T>> Function() call,T Function(dynamic) fromJsonT);
}
