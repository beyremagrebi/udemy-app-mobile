class DownloadProgress {
  final double progress;
  final String status;
  final String downloadedSize;
  final String totalSize;
  final bool isDownloading;

  const DownloadProgress({
    required this.progress,
    required this.status,
    required this.downloadedSize,
    required this.totalSize,
    required this.isDownloading,
  });

  DownloadProgress copyWith({
    double? progress,
    String? status,
    String? downloadedSize,
    String? totalSize,
    bool? isDownloading,
  }) {
    return DownloadProgress(
      progress: progress ?? this.progress,
      status: status ?? this.status,
      downloadedSize: downloadedSize ?? this.downloadedSize,
      totalSize: totalSize ?? this.totalSize,
      isDownloading: isDownloading ?? this.isDownloading,
    );
  }
}
