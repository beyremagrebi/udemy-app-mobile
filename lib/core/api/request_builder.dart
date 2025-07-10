import 'package:dio/dio.dart';

import '../../presentation/utils/session/token_manager.dart';

class RequestBuilder {
  static Future<Options> buildOptions(
    Map<String, dynamic>? headers, {
    required bool authRequired,
    String? githubToken,
    RequestType requestType = RequestType.json,
  }) async {
    final Map<String, dynamic> finalHeaders = headers ?? {};

    // Set content type based on request type
    String contentType;
    switch (requestType) {
      case RequestType.json:
        contentType = 'application/json';
        break;
      case RequestType.multipart:
        contentType = 'multipart/form-data';
        break;
      case RequestType.urlEncoded:
        contentType = 'application/x-www-form-urlencoded';
        break;
    }

    final options = Options(
      headers: finalHeaders,
      contentType: contentType,
    );

    await _addAuthorizationHeaders(options, authRequired, githubToken);

    return options;
  }

  static Future<void> _addAuthorizationHeaders(
    Options options,
    bool authRequired,
    String? githubToken,
  ) async {
    if (authRequired) {
      if (TokenManager.accessToken == null) {
        await TokenManager.shared.load();
      }
      options.headers?['Authorization'] = 'Bearer ${TokenManager.accessToken}';
    }

    if (githubToken != null) {
      options.headers?['Authorization'] = 'Bearer $githubToken';
    }
  }
}

enum RequestType {
  json,
  multipart,
  urlEncoded,
}
