import 'dart:async';

import '../../../core/api/api_services.dart';
import '../../interfaces/app/i_download_manager.dart';
import '../../models/global/download_progress.dart';

class DownloadManager implements IDownloadManager {
  final StreamController<DownloadProgress> _progressController =
      StreamController<DownloadProgress>.broadcast();

  bool _isDownloading = false;
  Function? _cancelCallback;

  @override
  bool get isDownloading => _isDownloading;

  @override
  Stream<DownloadProgress> get progressStream => _progressController.stream;

  @override
  void cancelDownload() {
    if (_isDownloading) {
      if (_cancelCallback != null) {
        _cancelCallback!();
      }
      _isDownloading = false;
      _emitProgress(const DownloadProgress(
        progress: 0,
        status: 'Download cancelled',
        downloadedSize: '',
        totalSize: '',
        isDownloading: false,
      ));

      Future.delayed(const Duration(seconds: 2), () {
        _emitProgress(const DownloadProgress(
          progress: 0,
          status: '',
          downloadedSize: '',
          totalSize: '',
          isDownloading: false,
        ));
      });
    }
  }

  void dispose() {
    _progressController.close();
  }

  @override
  Future<String?> downloadApk({
    required String apkUrl,
    required String fileName,
  }) async {
    if (_isDownloading) {
      _emitProgress(const DownloadProgress(
        progress: 0,
        status: 'Download already in progress',
        downloadedSize: '',
        totalSize: '',
        isDownloading: true,
      ));
      return null;
    }

    _isDownloading = true;
    _emitProgress(const DownloadProgress(
      progress: 0,
      status: 'Preparing download...',
      downloadedSize: '',
      totalSize: '',
      isDownloading: true,
    ));

    try {
      _cancelCallback = ApiService.instance.downloadService.cancelDownload;

      final filePath = await ApiService.instance.downloadService.downloadApk(
        apkUrl: apkUrl,
        fileName: fileName,
        onProgress: (received, total) {
          if (total > 0) {
            final progress = received / total;
            _emitProgress(DownloadProgress(
              progress: progress,
              status: 'Downloading...',
              downloadedSize: _formatBytes(received),
              totalSize: _formatBytes(total),
              isDownloading: true,
            ));
          }
        },
      );

      if (filePath != null && _isDownloading) {
        _emitProgress(const DownloadProgress(
          progress: 1,
          status: 'Download completed. Installing...',
          downloadedSize: '',
          totalSize: '',
          isDownloading: false,
        ));
        return filePath;
      } else if (!_isDownloading) {
        _emitProgress(const DownloadProgress(
          progress: 0,
          status: 'Download cancelled',
          downloadedSize: '',
          totalSize: '',
          isDownloading: false,
        ));
        return null;
      } else {
        _emitProgress(const DownloadProgress(
          progress: 0,
          status: 'Download failed. Please try again.',
          downloadedSize: '',
          totalSize: '',
          isDownloading: false,
        ));
        return null;
      }
    } on Exception catch (e) {
      if (_isDownloading) {
        _emitProgress(DownloadProgress(
          progress: 0,
          status: 'Download failed: ${e.toString()}',
          downloadedSize: '',
          totalSize: '',
          isDownloading: false,
        ));
      }
      return null;
    } finally {
      _isDownloading = false;
      _cancelCallback = null;
    }
  }

  void _emitProgress(DownloadProgress progress) {
    if (!_progressController.isClosed) {
      _progressController.add(progress);
    }
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    }
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}
