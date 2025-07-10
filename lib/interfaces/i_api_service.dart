import 'package:dio/dio.dart';

import '../core/api/api_response.dart';

enum DioMethod { get, post, put, patch, delete }

abstract class IApiService {
  Future<ApiResponse<T>> multipartRequest<T>({
    required String url,
    required T Function(dynamic json) fromJson,
    required FormData formData,
    DioMethod method = DioMethod.post,
    Map<String, dynamic>? queryParameters,
    String? dataKey,
    bool authRequired = true,
    String? githubToken,
    Map<String, dynamic>? headers,
    ProgressCallback? onSendProgress,
  });

  Future<ApiResponse<T>> request<T>({
    required String url,
    required T Function(dynamic json) fromJson,
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    String? dataKey,
    bool authRequired = true,
    String? githubToken,
    Map<String, dynamic>? headers,
  });

  Future<ApiResponse<T>> uploadFile<T>({
    required String url,
    required T Function(dynamic json) fromJson,
    required String filePath,
    required String fieldName,
    Map<String, dynamic>? additionalFields,
    Map<String, dynamic>? queryParameters,
    String? dataKey,
    bool authRequired = true,
    String? githubToken,
    Map<String, dynamic>? headers,
    ProgressCallback? onSendProgress,
  });
}
