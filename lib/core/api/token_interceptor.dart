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

        // Create new request options with proper handling for multipart
        final newRequest = _createRetryRequest(err.requestOptions);

        // Update authorization header with new token
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
    return handler.next(options);
  }

  RequestOptions _createRetryRequest(RequestOptions originalOptions) {
    final newRequest = RequestOptions(
      path: originalOptions.path,
      method: originalOptions.method,
      baseUrl: originalOptions.baseUrl,
      headers: Map<String, dynamic>.from(originalOptions.headers),
      queryParameters: originalOptions.queryParameters,
      connectTimeout: originalOptions.connectTimeout,
      receiveTimeout: originalOptions.receiveTimeout,
      sendTimeout: originalOptions.sendTimeout,
      responseType: originalOptions.responseType,
      validateStatus: originalOptions.validateStatus,
      receiveDataWhenStatusError: originalOptions.receiveDataWhenStatusError,
      followRedirects: originalOptions.followRedirects,
      maxRedirects: originalOptions.maxRedirects,
      persistentConnection: originalOptions.persistentConnection,
      requestEncoder: originalOptions.requestEncoder,
      responseDecoder: originalOptions.responseDecoder,
      listFormat: originalOptions.listFormat,
    );

    // Handle different types of request data
    if (originalOptions.data is FormData) {
      // For multipart requests, we need to recreate the FormData
      final originalFormData = originalOptions.data as FormData;
      final newFormData = FormData();

      // Copy fields
      for (final field in originalFormData.fields) {
        newFormData.fields.add(MapEntry(field.key, field.value));
      }

      // Copy files
      for (final file in originalFormData.files) {
        newFormData.files.add(MapEntry(file.key, file.value));
      }

      newRequest.data = newFormData;
      // Ensure content type is set correctly for multipart
      newRequest.contentType = 'multipart/form-data';
    } else {
      // For regular requests, copy data as is
      newRequest.data = originalOptions.data;
      newRequest.contentType = originalOptions.contentType;
    }

    return newRequest;
  }
}
