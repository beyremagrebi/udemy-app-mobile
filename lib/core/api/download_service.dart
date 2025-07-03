// ignore_for_file: avoid_slow_async_io

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../../interfaces/i_download_service.dart';

class DownloadService implements IDownloadService {
  final Dio _dio;
  CancelToken? _downloadCancelToken;

  DownloadService(this._dio);

  @override
  bool get isDownloadActive =>
      _downloadCancelToken != null && !_downloadCancelToken!.isCancelled;

  @override
  void cancelDownload() {
    if (_downloadCancelToken != null && !_downloadCancelToken!.isCancelled) {
      _downloadCancelToken!.cancel('Download cancelled by user');
    }
    _downloadCancelToken = null;
  }

  @override
  Future<String?> downloadApk({
    required String apkUrl,
    String? fileName,
    dynamic Function(int received, int total)? onProgress,
  }) async {
    try {
      if (isDownloadActive) {
        cancelDownload();
        await Future<dynamic>.delayed(const Duration(milliseconds: 500));
      }

      if (!_isValidUrl(apkUrl)) {
        return null;
      }

      final isValidApk = await _validateApkUrl(apkUrl);
      if (!isValidApk) {
        return null;
      }

      return await downloadFile(
        fileUrl: apkUrl,
        fileName: fileName ?? 'app_update.apk',
        onProgress: onProgress,
      );
    } on Exception catch (e) {
      if (e is DioException && e.type == DioExceptionType.cancel) {
        return null;
      }
      return null;
    } finally {
      _downloadCancelToken = null;
    }
  }

  @override
  Future<String?> downloadFile({
    required String fileUrl,
    String? fileName,
    dynamic Function(int received, int total)? onProgress,
  }) async {
    try {
      _downloadCancelToken ??= CancelToken();

      final savePath =
          await _prepareSavePath(fileName ?? 'downloaded_file.apk');
      if (savePath == null) {
        return null;
      }

      return await _downloadWithRetry(
        fileUrl: fileUrl,
        savePath: savePath,
        onProgress: onProgress,
      );
    } on Exception catch (e) {
      if (e is DioException && e.type == DioExceptionType.cancel) {
        return null;
      }
      return null;
    }
  }

  Options _buildDownloadOptions() {
    return Options(
      headers: {
        'Accept': '*/*',
        'User-Agent': 'Flutter App Updater/1.0',
        'Accept-Encoding': 'identity',
      },
      followRedirects: true,
      maxRedirects: 5,
      validateStatus: (status) => status != null && status < 400,
    );
  }

  Future<void> _cleanupFile(String savePath) async {
    try {
      final file = File(savePath);
      if (await file.exists()) {
        await file.delete();
      }
    } on Exception {
      // Ignore cleanup errors
    }
  }

  Future<String?> _downloadWithRetry({
    required String fileUrl,
    required String savePath,
    dynamic Function(int received, int total)? onProgress,
    int maxRetries = 3,
  }) async {
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        if (_downloadCancelToken?.isCancelled ?? false) {
          return null;
        }

        final response = await _dio.download(
          fileUrl,
          savePath,
          cancelToken: _downloadCancelToken,
          onReceiveProgress: (received, total) {
            if (_downloadCancelToken?.isCancelled ?? false) {
              return;
            }
            onProgress?.call(received, total);
          },
          options: _buildDownloadOptions(),
        );

        if (_downloadCancelToken?.isCancelled ?? false) {
          await _cleanupFile(savePath);
          return null;
        }

        if (response.statusCode == 200) {
          final isValid = await _validateDownloadedFile(savePath);
          return isValid ? savePath : null;
        } else {
          throw Exception(
              'Download failed with status code: ${response.statusCode}');
        }
      } on Exception catch (e) {
        if (e is DioException && e.type == DioExceptionType.cancel) {
          await _cleanupFile(savePath);
          return null;
        }

        retryCount++;
        if (retryCount >= maxRetries) {
          rethrow;
        }

        if (_downloadCancelToken?.isCancelled ?? false) {
          return null;
        }
        await Future<dynamic>.delayed(Duration(seconds: retryCount * 2));
      }
    }
    return null;
  }

  bool _isValidUrl(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }

  Future<String?> _prepareSavePath(String fileName) async {
    try {
      Directory? dir;
      if (Platform.isAndroid) {
        dir = await getExternalStorageDirectory();
        dir ??= await getApplicationDocumentsDirectory();
      } else {
        dir = await getApplicationDocumentsDirectory();
      }

      final downloadsDir = Directory('${dir.path}/downloads');
      if (!await downloadsDir.exists()) {
        await downloadsDir.create(recursive: true);
      }

      final savePath = '${downloadsDir.path}/$fileName';
      final file = File(savePath);
      if (await file.exists()) {
        await file.delete();
      }

      return savePath;
    } on Exception {
      return null;
    }
  }

  Future<bool> _validateApkUrl(String apkUrl) async {
    try {
      _downloadCancelToken = CancelToken();
      final headResponse = await _dio.head<dynamic>(
        apkUrl,
        cancelToken: _downloadCancelToken,
        options: Options(headers: {
          'Authorization': 'your_github_token',
        }),
      );
      return headResponse.statusCode == 200;
    } on Exception {
      return false;
    }
  }

  Future<bool> _validateDownloadedFile(String savePath) async {
    try {
      final downloadedFile = File(savePath);
      if (!await downloadedFile.exists()) {
        return false;
      }

      final fileSize = await downloadedFile.length();
      return fileSize >= 1024; // Basic size validation
    } on Exception {
      return false;
    }
  }
}
