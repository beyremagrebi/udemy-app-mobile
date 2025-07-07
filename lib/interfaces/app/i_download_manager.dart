import 'package:erudaxis/models/global/download_progress.dart';

abstract class IDownloadManager {
  bool get isDownloading;
  Stream<DownloadProgress> get progressStream;
  void cancelDownload();
  Future<String?> downloadApk({
    required String apkUrl,
    required String fileName,
  });
}
