import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../presentation/utils/session/token_manager.dart';

class TokenInterceptor extends Interceptor {
  final Dio _dio;

  TokenInterceptor(this._dio);

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 498 || err.response?.statusCode == 401) {
      try {
        await TokenManager.shared.refreshTken();

        final newRequest = err.requestOptions;
        newRequest.headers['Authorization'] =
            'Bearer ${TokenManager.accessToken}';

        final retryResponse = await _dio.fetch<dynamic>(newRequest);

        return handler.resolve(retryResponse);
      } on Exception catch (e) {
        debugPrint('Token refresh failed: $e');
        return handler.next(err);
      }
    } else {
      return handler.next(err);
    }
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (TokenManager.accessToken == null) {
      await TokenManager.shared.load();
    }
    options.headers['Authorization'] = 'Bearer ${TokenManager.accessToken}';
    return handler.next(options);
  }
}
