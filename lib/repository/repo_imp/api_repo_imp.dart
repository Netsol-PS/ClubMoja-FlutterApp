import 'package:dio/dio.dart';

import '../../data/models/responses/api_response.dart';
import '../../data/models/responses/base_response.dart';
import '../interfaces/api_repo.dart';

class ApiRepoImpl implements ApiRepo {
  ApiRepoImpl();

  @override
  Future<IResponse<T>> handleRequest<T>(
      Future<Response> Function() call, T Function(dynamic) fromJsonT) async {
    try {
      final response = await call();
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {

        final baseResponse = BaseResponse<T>.fromJson(response.data as Map<String, dynamic>, fromJsonT);
        final String? responseStatusCode = baseResponse.code;

        if (responseStatusCode == null || responseStatusCode.isEmpty) {
          return IResponse.failure(ApiError(
            errorCode: ErrorCode.unknown,
            message: baseResponse.message ?? "Unknown Error",
          ));
        } else if (responseStatusCode == "UNAUTHORIZED") {
          return IResponse.failure(ApiError(
            errorCode: ErrorCode.unauthorized,
            message: baseResponse.message ?? "Unauthorized Access",
          ));
        } else {
          return IResponse.success(baseResponse.data);
        }
      } else {
        return _handleFailureResponse(response);
      }
    } catch (e) {
      return _handleException(e);
    }
  }

  IResponse<T> _handleFailureResponse<T>(Response response) {
    final errorCode = _mapStatusCodeToErrorCode(response.statusCode.toString());
    final message = response.data['message'] ?? "Something went wrong.";
    return Failure(ApiError(errorCode: errorCode, message: message));
  }

  IResponse<T> _handleException<T>(Object exception) {
    if (exception is DioException) {
      if (exception.type == DioExceptionType.connectionError) {
        return Failure(ApiError(
          errorCode: ErrorCode.noNetwork,
          message: "No internet connection.",
        ));
      } else if (exception.type == DioExceptionType.badResponse) {
        return Failure(ApiError(
          errorCode: ErrorCode.badResponse,
          message: "Bad Response from server",
        ));
      } else if (exception.type == DioExceptionType.connectionTimeout ||
          exception.type == DioExceptionType.receiveTimeout ||
          exception.type == DioExceptionType.sendTimeout) {
        return Failure(ApiError(
          errorCode: ErrorCode.badResponse,
          message: "Server not available",
        ));
      }
    }
    return Failure(ApiError(
      errorCode: ErrorCode.unknown,
      message: exception.toString(),
    ));
  }

  ErrorCode _mapStatusCodeToErrorCode(String code) {
    switch (code) {
      case "401":
        return ErrorCode.unauthorized;
      case "404":
        return ErrorCode.notFound;
      case "500":
        return ErrorCode.badResponse;
      case "503":
        return ErrorCode.serviceUnavailable;
      case "405":
        return ErrorCode.noNetwork;
      case "429":
        return ErrorCode.coolDownOtp;
      case "406":
        return ErrorCode.invalidOtp;
      case "403":
        return ErrorCode.accessTokenExpired;
      case "409":
        return ErrorCode.conflict;
      default:
        return ErrorCode.unknown;
    }
  }
}
