sealed class IResponse<T> {
  final bool isSuccessful;
  final T? data;
  final ApiError? error;

  const IResponse({required this.isSuccessful, this.data, this.error});

  const factory IResponse.success(T? data) = Success<T>;

  const factory IResponse.failure(ApiError error) = Failure<T>;
}

class Success<T> extends IResponse<T> {
  const Success(T? data) : super(isSuccessful: true, data: data, error: null);
}

class Failure<T> extends IResponse<T> {
  const Failure(ApiError error)
      : super(isSuccessful: false, data: null, error: error);
}

// ApiError for handling error details
class ApiError {
  final ErrorCode errorCode;
  final String message;

  ApiError({required this.errorCode, required this.message});
}

class ErrorCode {
  final String code;

  const ErrorCode._(this.code);

  static const unauthorized = ErrorCode._("401");
  static const noNetwork = ErrorCode._("405");
  static const coolDownOtp = ErrorCode._("429");
  static const invalidOtp = ErrorCode._("406");
  static const accessTokenExpired = ErrorCode._("403");
  static const badResponse = ErrorCode._("500");
  static const serviceUnavailable = ErrorCode._("503");
  static const conflict = ErrorCode._("409");
  static const unknown = ErrorCode._("5422");
  static const exception = ErrorCode._("5425");
  static const notFound = ErrorCode._("404");

  @override
  String toString() => code;
}

ErrorCode mapStatusCodeToErrorCode(String code) {
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
