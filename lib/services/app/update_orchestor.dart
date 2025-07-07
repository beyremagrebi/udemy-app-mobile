import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/interfaces/app/i_download_manager.dart';
import 'package:erudaxis/interfaces/app/i_installation_manager.dart';
import 'package:erudaxis/interfaces/app/i_permession_manager.dart';
import 'package:erudaxis/interfaces/app/i_update_download_manager.dart';
import 'package:erudaxis/interfaces/app/i_version_checker.dart';
import 'package:erudaxis/models/github/github_release.dart';
import 'package:erudaxis/models/global/download_progress.dart';
import 'package:flutter/material.dart';

import '../../interfaces/app/i_interface_package_service.dart';

class UpdateOrchestrator {
  final IPackageInfoService _packageInfoService;
  final IVersionChecker _versionChecker;
  final IDownloadManager _downloadManager;
  final IPermissionManager _permissionManager;
  final IInstallationManager _installationManager;
  final IUpdateDialogManager _dialogManager;

  UpdateOrchestrator({
    required IPackageInfoService packageInfoService,
    required IVersionChecker versionChecker,
    required IDownloadManager downloadManager,
    required IPermissionManager permissionManager,
    required IInstallationManager installationManager,
    required IUpdateDialogManager dialogManager,
  })  : _packageInfoService = packageInfoService,
        _versionChecker = versionChecker,
        _downloadManager = downloadManager,
        _permissionManager = permissionManager,
        _installationManager = installationManager,
        _dialogManager = dialogManager;

  String get currentVersion => _packageInfoService.currentVersion;

  Stream<DownloadProgress> get downloadProgressStream =>
      _downloadManager.progressStream;

  bool get isDownloading => _downloadManager.isDownloading;

  void cancelDownload() {
    _downloadManager.cancelDownload();
  }

  Future<void> checkForUpdates(GithubRelease githubRelease) async {
    if (githubRelease.version == null) {
      return;
    }

    try {
      if (_versionChecker.isVersionOutdated(
        _packageInfoService.currentVersion,
        githubRelease.version!,
      )) {
        final shouldUpdate =
            await _dialogManager.showUpdateAvailableDialog(githubRelease);
        if (shouldUpdate != null && shouldUpdate == true) {
          await _startDownloadWithProgressDialog(githubRelease);
        }
      }
    } on Exception {
      await _dialogManager.showErrorDialog(
        intl.updateCheckFailedTitle,
        intl.updateCheckFailedMessage,
      );
    }
  }

  Future<void> downloadAndInstallUpdate(GithubRelease githubRelease) async {
    if (_downloadManager.isDownloading) {
      return;
    }

    try {
      if (!await _permissionManager.requestAllPermissions()) {
        await _dialogManager.showErrorDialog(
          intl.permissionsRequiredTitle,
          intl.permissionsRequiredMessage,
        );
        return;
      }

      final apkUrl = githubRelease.donwnloadUrl ?? '';
      final fileName = 'beyrem-v${githubRelease.version}.apk';

      final filePath = await _downloadManager.downloadApk(
        apkUrl: apkUrl,
        fileName: fileName,
      );

      if (filePath != null) {
        try {
          await _installationManager.installApk(filePath);
          if (mainContext.mounted) {
            Navigator.of(mainContext).pop();
          }
          await _dialogManager.showSuccessDialog();
        } on Exception catch (installError) {
          if (mainContext.mounted) {
            Navigator.of(mainContext).pop();
          }

          await _dialogManager.showErrorDialog(
            intl.installationFailedTitle,
            installError.toString(),
          );
        }
      }
    } on Exception {
      if (mainContext.mounted) {
        Navigator.of(mainContext).pop();
      }

      await _dialogManager.showErrorDialog(
        intl.updateFailedTitle,
        intl.updateCheckFailedMessage,
      );
    }
  }

  Future<void> initialize() async {
    await _packageInfoService.initialize();
  }

  Future<void> _startDownloadWithProgressDialog(
    GithubRelease githubRelease,
  ) async {
    _dialogManager.showDownloadProgressDialog(githubRelease);
    await downloadAndInstallUpdate(githubRelease);
    if (mainContext.mounted) {
      Navigator.of(mainContext).pop();
    }
  }
}
