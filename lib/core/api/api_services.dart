import 'package:dio/dio.dart';
import 'package:erudaxis/core/constants/env.dart';

import 'api_response.dart';

class ApiService {
  static final ApiService instance = ApiService._singleton();

  final Dio _dio;

  ApiService._singleton()
      : _dio = Dio(BaseOptions(
          baseUrl: baseURl,
          connectTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(minutes: 1),
          receiveTimeout: const Duration(minutes: 1),
          validateStatus: (status) {
            if (status == 498 || status == 500 || status == 401) {
              return false;
            }
            return true;
          },
        ));

  Future<ApiResponse<Data>> request<Data>({
    required String url,
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? queryParameters,
    Data? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final options = Options(
        headers: headers,
      );

      Response<Data> response;

      switch (method) {
        case DioMethod.get:
          response = await _dio.get<Data>(
            url,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case DioMethod.post:
          response = await _dio.post<Data>(
            url,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case DioMethod.put:
          response = await _dio.put<Data>(
            url,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case DioMethod.patch:
          response = await _dio.patch<Data>(
            url,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case DioMethod.delete:
          response = await _dio.delete<Data>(
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
        return ApiResponse<Data>.success(response);
      } else {
        return ApiResponse<Data>.badRequest(response);
      }
    } on DioException catch (e) {
      return ApiResponse<Data>.error(
        requestOptions: e.requestOptions,
        statusCode: e.response?.statusCode,
        headers: e.response?.headers,
        errorMessage: e.message ?? 'Unknown error',
      );
    }
  }
}

enum DioMethod { get, post, put, patch, delete }
