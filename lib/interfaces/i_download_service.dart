abstract class IDownloadService {
  bool get isDownloadActive;
  void cancelDownload();
  Future<String?> downloadApk({
    required String apkUrl,
    String? fileName,
    dynamic Function(int received, int total)? onProgress,
  });
  Future<String?> downloadFile({
    required String fileUrl,
    String? fileName,
    dynamic Function(int received, int total)? onProgress,
  });
}
