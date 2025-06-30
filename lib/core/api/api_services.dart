import 'package:dio/dio.dart';
import 'package:erudaxis/core/constants/env.dart';

import 'api_response.dart';
import 'token_interceptor.dart';

class ApiService {
  static final ApiService instance = ApiService._singleton();
  final Dio _dio;

  ApiService._singleton()
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseURl,
            connectTimeout: const Duration(seconds: 10),
            sendTimeout: const Duration(minutes: 1),
            receiveTimeout: const Duration(minutes: 1),
            validateStatus: (status) =>
                !(status == 498 || status == 500 || status == 401) &&
                status != null,
          ),
        ) {
    _dio.interceptors.add(TokenInterceptor(_dio));
  }

  Future<ApiResponse<T>> request<T>({
    required String url,
    required T Function(dynamic json) fromJson,
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    String? dataKey,
    Map<String, dynamic>? headers,
  }) async {
    try {
      headers ??= {};
      final options = RequestBuilder.buildOptions(headers);

      Response<dynamic> response;

      switch (method) {
        case DioMethod.get:
          response = await _dio.get(
            url,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case DioMethod.post:
          response = await _dio.post(
            url,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case DioMethod.put:
          response = await _dio.put(
            url,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case DioMethod.patch:
          response = await _dio.patch(
            url,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case DioMethod.delete:
          response = await _dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
      }

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        if (dataKey != null) {
          response.data = response.data[dataKey];
        }
        final T convertedData = fromJson(response.data);

        final Response<T> typedResponse = Response<T>(
          data: convertedData,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
          requestOptions: response.requestOptions,
          headers: response.headers,
        );

        return ApiResponse<T>.success(typedResponse);
      } else {
        final typedResponse = Response<T>(
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
          requestOptions: response.requestOptions,
          headers: response.headers,
        );
        return ApiResponse<T>.badRequest(typedResponse, response.data);
      }
    } on DioException catch (e) {
      return ApiResponse<T>.error(
        requestOptions: e.requestOptions,
        statusCode: e.response?.statusCode,
        headers: e.response?.headers,
        errorMessage: e.message ?? 'Unknown error',
      );
    }
  }
}

enum DioMethod { get, post, put, patch, delete }

class RequestBuilder {
  static Options buildOptions(Map<String, dynamic>? headers) {
    return Options(
      headers: headers,
      contentType: 'application/json',
    );
  }
}
