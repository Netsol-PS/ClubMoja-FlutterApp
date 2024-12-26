class BaseResponse<T> {
  final String? code;
  final String? message;
  final T? data;

  BaseResponse({this.code, this.message, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return BaseResponse(
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}