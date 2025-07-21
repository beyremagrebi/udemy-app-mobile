import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../presentation/utils/session/token_manager.dart';

class TokenInterceptor extends Interceptor {
  final Dio _dio;
  TokenInterceptor(this._dio);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 498) {
      try {
        final success = await TokenManager.shared.refreshTken();

        if (!success) {
          return handler.next(err);
        }

        final newRequest = _createRetryRequest(err.requestOptions);
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
    if (originalOptions.data is FormData) {
      final originalFormData = originalOptions.data as FormData;
      final newFormData = FormData();
      for (final field in originalFormData.fields) {
        newFormData.fields.add(MapEntry(field.key, field.value));
      }
      for (final file in originalFormData.files) {
        final MultipartFile originalFile = file.value;
        newFormData.files.add(MapEntry(file.key, originalFile.clone()));
      }
      newRequest.data = newFormData;
      newRequest.contentType = 'multipart/form-data';
    } else {
      newRequest.data = originalOptions.data;
      newRequest.contentType = originalOptions.contentType;
    }
    return newRequest;
  }
}
