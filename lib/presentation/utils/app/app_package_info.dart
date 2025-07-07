import 'dart:async';

import 'package:erudaxis/models/github/github_release.dart';
import 'package:flutter/material.dart';

import '../../../models/global/download_progress.dart';
import '../../../services/app/app_update_fascade.dart';

class AppPackageInfo {
  static ValueNotifier<double> downloadProgress = ValueNotifier(0);
  static ValueNotifier<String> downloadStatus = ValueNotifier('');
  static ValueNotifier<bool> isDownloading = ValueNotifier(false);
  static ValueNotifier<String> downloadSize = ValueNotifier('');
  static ValueNotifier<String> totalSize = ValueNotifier('');

  static StreamSubscription<DownloadProgress>? _progressSubscription;

  static Function? cancelDownloadCallback;

  static String get appVersion => AppUpdateFacade.instance.currentVersion;

  static void cancelDownload() {
    AppUpdateFacade.instance.cancelDownload();
  }

  static Future<void> checkUpdateVersion(GithubRelease githubRelease) async {
    await AppUpdateFacade.instance.checkForUpdates(githubRelease);
  }

  static void dispose() {
    _progressSubscription?.cancel();
    _progressSubscription = null;
  }

  static Future<void> downloadAndInstallApk(GithubRelease githubRelease) async {
    await AppUpdateFacade.instance.downloadAndInstallUpdate(githubRelease);
  }

  static Future<void> initialize() async {
    await AppUpdateFacade.instance.initialize();

    // Subscribe to the download progress stream and update ValueNotifiers
    _progressSubscription = AppUpdateFacade.instance.downloadProgressStream
        .cast<DownloadProgress>()
        .listen((progress) {
      downloadProgress.value = progress.progress;
      downloadStatus.value = progress.status;
      isDownloading.value = progress.isDownloading;
      downloadSize.value = progress.downloadedSize;
      totalSize.value = progress.totalSize;
    });
  }

  static bool isAppOutdated(GithubRelease githubRelease) {
    if (githubRelease.version == null) {
      return false;
    }

    return AppUpdateFacade.instance.isVersionOutdated(
      appVersion,
      githubRelease.version!,
    );
  }
}
