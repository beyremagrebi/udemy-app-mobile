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
          // Show progress dialog immediately and start download
          await _startDownloadWithProgressDialog(githubRelease);
        }
      }
    } on Exception catch (e) {
      await _dialogManager.showErrorDialog(
        'Update Check Failed',
        'Error checking for updates: ${e.toString()}',
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
          'Permissions Required',
          'Required permissions denied',
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
          // Close progress dialog before showing success
          if (mainContext.mounted) {
            Navigator.of(mainContext).pop();
          }
          await _dialogManager.showSuccessDialog();
        } on Exception catch (installError) {
          // Close progress dialog before showing error
          if (mainContext.mounted) {
            Navigator.of(mainContext).pop();
          }
          await _dialogManager.showErrorDialog(
            'Installation Failed',
            installError.toString(),
          );
        }
      }
    } on Exception catch (e) {
      // Close progress dialog before showing error
      if (mainContext.mounted) {
        Navigator.of(mainContext).pop();
      }
      await _dialogManager.showErrorDialog(
        'Update Failed',
        'Error during update: ${e.toString()}',
      );
    }
  }

  Future<void> initialize() async {
    await _packageInfoService.initialize();
  }

  Future<void> _startDownloadWithProgressDialog(
      GithubRelease githubRelease) async {
    // Show the progress dialog
    _dialogManager.showDownloadProgressDialog(githubRelease);

    // Start the download and installation process
    await downloadAndInstallUpdate(githubRelease);

    // Close the progress dialog when complete
    if (mainContext.mounted) {
      Navigator.of(mainContext).pop();
    }
  }
}
