import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/response_message.dart';

class ApiResponse<T> extends Response<T> {
  final bool isSuccess;
  final String? errorMessage;
  final Status status;

  ApiResponse({
    required super.requestOptions,
    required super.headers,
    super.data,
    super.statusCode,
    super.statusMessage,
    this.isSuccess = false,
    this.errorMessage,
    this.status = Status.success,
  });

  factory ApiResponse.badRequest(Response<T> response, dynamic data) {
    return ApiResponse<T>(
      requestOptions: response.requestOptions,
      headers: response.headers,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      status: Status.badRequest,
      errorMessage: ResponseMessage.fromDynamic(data).message,
    );
  }

  factory ApiResponse.error({
    required RequestOptions requestOptions,
    required String errorMessage,
    int? statusCode,
    Headers? headers,
  }) {
    return ApiResponse<T>(
      requestOptions: requestOptions,
      headers: headers ?? Headers(),
      statusCode: statusCode,
      errorMessage: errorMessage,
      status: Status.error,
    );
  }

  factory ApiResponse.success(Response<T> response) {
    return ApiResponse<T>(
      requestOptions: response.requestOptions,
      headers: response.headers,
      data: response.data,
      isSuccess: true,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  @override
  String toString() {
    return 'ApiResponse{status: $status, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, errorMessage: $errorMessage}';
  }
}

enum Status { loading, success, badRequest, error }
