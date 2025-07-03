import '../core/api/api_response.dart';

enum DioMethod { get, post, put, patch, delete }

abstract class IApiService {
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
}
