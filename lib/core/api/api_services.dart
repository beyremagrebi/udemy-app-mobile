import 'package:dio/dio.dart';

import '../../interfaces/i_api_service.dart';
import '../../interfaces/i_download_service.dart';
import '../../presentation/utils/session/token_manager.dart';
import 'api_response.dart';
import 'download_service.dart';
import 'token_interceptor.dart';

class ApiService implements IApiService {
  static final ApiService instance = ApiService._singleton();

  final Dio _dio;
  late final IDownloadService _downloadService;

  ApiService._singleton()
      : _dio = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 10),
            sendTimeout: const Duration(minutes: 1),
            receiveTimeout: const Duration(minutes: 1),
            validateStatus: (status) =>
                !(status == 498 || status == 500 || status == 401) &&
                status != null,
          ),
        ) {
    _downloadService = DownloadService(_dio);
    _dio.interceptors.add(TokenInterceptor(_dio));
  }

  // Expose download service
  IDownloadService get downloadService => _downloadService;

  @override
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
  }) async {
    try {
      headers = {};
      final options = await RequestBuilder.buildOptions(
        headers,
        authRequired: authRequired,
        githubToken: githubToken,
      );
      final response = await _executeRequest(
        method: method,
        url: url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return _handleResponse<T>(response, fromJson, dataKey);
    } on DioException catch (e) {
      return ApiResponse<T>.error(
        requestOptions: e.requestOptions,
        statusCode: e.response?.statusCode,
        headers: e.response?.headers,
        errorMessage: e.message ?? 'Unknown error',
      );
    }
  }

  Future<Response<dynamic>> _executeRequest({
    required DioMethod method,
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    switch (method) {
      case DioMethod.get:
        return await _dio.get(
          url,
          queryParameters: queryParameters,
          options: options,
        );
      case DioMethod.post:
        return await _dio.post(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
        );
      case DioMethod.put:
        return await _dio.put(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
        );
      case DioMethod.patch:
        return await _dio.patch(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
        );
      case DioMethod.delete:
        return await _dio.delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
        );
    }
  }

  ApiResponse<T> _handleResponse<T>(
    Response<dynamic> response,
    T Function(dynamic json) fromJson,
    String? dataKey,
  ) {
    if (_isSuccessResponse(response)) {
      final responseData =
          dataKey != null ? response.data[dataKey] : response.data;
      final convertedData = fromJson(responseData);

      final typedResponse = Response<T>(
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
  }

  bool _isSuccessResponse(Response<dynamic> response) {
    return response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300;
  }
}

class RequestBuilder {
  static Future<Options> buildOptions(
    Map<String, dynamic>? headers, {
    required bool authRequired,
    String? githubToken,
  }) async {
    final options = Options(
      headers: headers,
      contentType: 'application/json',
    );
    if (authRequired == true) {
      if (TokenManager.accessToken == null) {
        await TokenManager.shared.load();
      }
      options.headers?['Authorization'] = 'Bearer ${TokenManager.accessToken}';
    }
    if (githubToken != null) {
      options.headers?['Authorization'] = 'Bearer $githubToken';
    }
    return options;
  }
}
