import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:erudaxis/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/api/api_services.dart';
import '../alert_dialog.dart';

class AppPackageInfo {
  static late PackageInfo packageInfo;
  static late String appVersion;
  static ValueNotifier<double> downloadProgress = ValueNotifier(0);
  static ValueNotifier<String> downloadStatus = ValueNotifier('');
  static ValueNotifier<bool> isDownloading = ValueNotifier(false);
  static ValueNotifier<String> downloadSize = ValueNotifier('');
  static ValueNotifier<String> totalSize = ValueNotifier('');

  // Add a way to cancel the actual download
  static Function? cancelDownloadCallback;

  static void cancelDownload() {
    if (isDownloading.value) {
      // Call the actual cancel function if available
      if (cancelDownloadCallback != null) {
        cancelDownloadCallback!();
      }

      isDownloading.value = false;
      downloadStatus.value = 'Download cancelled';
      downloadProgress.value = 0.0;
      downloadSize.value = '';
      totalSize.value = '';

      Future.delayed(const Duration(seconds: 2), () {
        downloadStatus.value = '';
      });
    }
  }

  static Future<void> checkUpdateVersion(String? version) async {
    if (version == null) {
      downloadStatus.value = 'No version information available';
      return;
    }

    try {
      downloadStatus.value = 'Checking for updates...';
      if (_isVersionOutdated(appVersion, version)) {
        downloadStatus.value = 'New version available: $version';
        await _showUpdateAvailableDialog(version);
      } else {
        downloadStatus.value = 'App is up to date';
        await CustomAlertDialog.showSuccessDialog(
          context: mainContext,
          title: 'Up to Date',
          message:
              'Your app is already running the latest version ($appVersion).',
          buttonText: 'Great!',
        );
        Future.delayed(const Duration(seconds: 3), () {
          downloadStatus.value = '';
        });
      }
    } on Exception catch (e) {
      downloadStatus.value = 'Error checking for updates: ${e.toString()}';
      if (mainContext.mounted) {
        await CustomAlertDialog.showErrorDialog(
          context: mainContext,
          title: 'Update Check Failed',
          message: 'Error checking for updates: ${e.toString()}',
        );
      }
    }
  }

  static Future<void> downloadAndInstallApk(String version) async {
    if (isDownloading.value) {
      downloadStatus.value = 'Download already in progress';
      return;
    }

    try {
      if (!await _requestAllPermissions()) {
        downloadStatus.value = 'Required permissions denied';
        return;
      }

      isDownloading.value = true;
      downloadStatus.value = 'Preparing download...';
      downloadProgress.value = 0.0;
      downloadSize.value = '';
      totalSize.value = '';

      final apkUrl =
          'https://github.com/proservices-tc/Erudaxis-mobile/releases/download/v$version/app-release.apk';
      final fileName = 'erudaxis-v$version.apk';

      // Store the cancel callback
      cancelDownloadCallback =
          ApiService.instance.downloadService.cancelDownload;

      final filePath = await ApiService.instance.downloadService.downloadApk(
        apkUrl: apkUrl,
        fileName: fileName,
        onProgress: (received, total) {
          if (total > 0) {
            final progress = received / total;
            downloadProgress.value = progress;
            downloadSize.value = _formatBytes(received);
            totalSize.value = _formatBytes(total);
            downloadStatus.value = 'Downloading...';
          }
        },
      );

      if (filePath != null && isDownloading.value) {
        downloadStatus.value = 'Download completed. Installing...';
        await _installApk(filePath);
      } else if (!isDownloading.value) {
        downloadStatus.value = 'Download cancelled';
      } else {
        downloadStatus.value = 'Download failed. Please try again.';
      }
    } on Exception catch (e) {
      if (isDownloading.value) {
        downloadStatus.value = 'Download failed: ${e.toString()}';
      }
    } finally {
      isDownloading.value = false;
      cancelDownloadCallback = null;
    }
  }

  static Future<void> initialize() async {
    try {
      packageInfo = await PackageInfo.fromPlatform();
      appVersion = packageInfo.version;
    } on Exception catch (e) {
      debugPrint('Failed to initialize package info: $e');
      appVersion = '1.0.0';
    }
  }

  // Helper method to format bytes
  static String _formatBytes(int bytes) {
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

  static Future<bool> _hasInstallPermission() async {
    if (!Platform.isAndroid) {
      return true;
    }

    try {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt >= 26) {
        return await Permission.requestInstallPackages.isGranted;
      }
      return true;
    } on Exception catch (e) {
      debugPrint('Error checking install permission: $e');
      return false;
    }
  }

  static Future<void> _installApk(String filePath) async {
    try {
      final file = File(filePath);
      // ignore: avoid_slow_async_io
      final fileExist = await file.exists();
      if (!fileExist) {
        downloadStatus.value = 'APK file not found';
        return;
      }

      final fileSize = await file.length();
      if (fileSize < 1024) {
        downloadStatus.value = 'APK file appears to be corrupted';
        return;
      }

      if (!await _hasInstallPermission()) {
        downloadStatus.value =
            'Install permission required. Please enable "Install unknown apps" in settings.';
        await _openInstallPermissionSettings();
        return;
      }

      downloadStatus.value = 'Opening installer...';

      final result = await OpenFile.open(
        filePath,
        type: 'application/vnd.android.package-archive',
      );

      switch (result.type) {
        case ResultType.done:
          downloadStatus.value = 'Installer opened successfully';
          Future.delayed(const Duration(seconds: 2), () {
            downloadStatus.value = '';
            downloadProgress.value = 0.0;
            downloadSize.value = '';
            totalSize.value = '';
          });
          break;
        case ResultType.noAppToOpen:
          downloadStatus.value = 'No app available to install APK';
          await _tryAlternativeInstallMethod(filePath);
          break;
        case ResultType.permissionDenied:
          downloadStatus.value =
              'Permission denied. Please enable "Install unknown apps"';
          await _openInstallPermissionSettings();
          break;
        case ResultType.error:
        default:
          downloadStatus.value = 'Failed to open installer: ${result.message}';
          await _tryAlternativeInstallMethod(filePath);
          break;
      }
    } on Exception catch (e) {
      downloadStatus.value = 'Installation error: ${e.toString()}';
      debugPrint('Installation error: $e');
    }
  }

  static bool _isVersionOutdated(String current, String latest) {
    try {
      final List<int> currentParts = current.split('.').map(int.parse).toList();
      final List<int> latestParts = latest.split('.').map(int.parse).toList();
      final maxLength = [currentParts.length, latestParts.length]
          .reduce((a, b) => a > b ? a : b);

      while (currentParts.length < maxLength) {
        currentParts.add(0);
      }
      while (latestParts.length < maxLength) {
        latestParts.add(0);
      }

      for (int i = 0; i < maxLength; i++) {
        if (latestParts[i] > currentParts[i]) {
          return true;
        }
        if (latestParts[i] < currentParts[i]) {
          return false;
        }
      }
      return false;
    } on Exception catch (e) {
      debugPrint('Error comparing versions: $e');
      return false;
    }
  }

  static Future<void> _openInstallPermissionSettings() async {
    try {
      await Permission.requestInstallPackages.request();
    } on Exception catch (e) {
      debugPrint('Error opening install permission settings: $e');
    }
  }

  static Future<bool> _requestAllPermissions() async {
    if (!Platform.isAndroid) {
      return true;
    }

    try {
      final bool storageGranted = await _requestStoragePermission();
      final bool installGranted = await _requestInstallPermission();
      return storageGranted && installGranted;
    } on Exception catch (e) {
      debugPrint('Error requesting permissions: $e');
      return false;
    }
  }

  static Future<bool> _requestInstallPermission() async {
    if (!Platform.isAndroid) {
      return true;
    }

    try {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;

      if (androidInfo.version.sdkInt >= 26) {
        final status = await Permission.requestInstallPackages.request();
        if (status.isGranted) {
          debugPrint('Install packages permission granted');
          return true;
        } else {
          debugPrint('Install packages permission denied: $status');
          return false;
        }
      }
      return true;
    } on Exception catch (e) {
      debugPrint('Error requesting install permission: $e');
      return false;
    }
  }

  static Future<bool> _requestStoragePermission() async {
    if (!Platform.isAndroid) {
      return true;
    }

    try {
      if (await Permission.manageExternalStorage.isGranted) {
        return true;
      }

      var status = await Permission.manageExternalStorage.request();
      if (status.isGranted) {
        return true;
      }

      status = await Permission.storage.request();
      return status.isGranted;
    } on Exception catch (e) {
      debugPrint('Storage permission request error: $e');
      return false;
    }
  }

  static Future<bool?> _showCancelConfirmationDialog(
      BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomAlertDialog.buildCustomDialog(
          context: context,
          icon: Icons.cancel_outlined,
          iconColor: CustomAlertDialog.warningColor,
          title: 'Cancel Download?',
          message:
              'Are you sure you want to cancel the download? You can always update later from settings.',
          primaryButtonText: 'Cancel Download',
          primaryButtonColor: CustomAlertDialog.errorColor,
          secondaryButtonText: 'Continue Download',
          onPrimaryPressed: () => Navigator.of(context).pop(true),
          onSecondaryPressed: () => Navigator.of(context).pop(false),
        );
      },
    );
  }

  static Future<void> _showUpdateAvailableDialog(String version) async {
    return showDialog<void>(
      context: mainContext,
      barrierDismissible: false,
      builder: (xcontext) {
        return CustomAlertDialog.buildCustomDialog(
          context: mainContext,
          icon: Icons.system_update,
          iconColor: CustomAlertDialog.primaryPurple,
          title: 'Update Available',
          message:
              'Version $version is now available!\nCurrent version: $appVersion\n\nWould you like to download and install the update now?',
          primaryButtonText: 'Update Now',
          primaryButtonColor: CustomAlertDialog.primaryPurple,
          secondaryButtonText: 'Not Now',
          onPrimaryPressed: () {
            Navigator.of(mainContext).pop();
            _startDownloadWithDialog(version);
          },
          onSecondaryPressed: () {
            Navigator.of(mainContext).pop();
            downloadStatus.value = '';
          },
        );
      },
    );
  }

  static Future<void> _startDownloadWithDialog(String version) async {
    showDialog<void>(
      context: mainContext,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 340),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF1E1B4B),
                  CustomAlertDialog.primaryPurple.withOpacity(0.9),
                  CustomAlertDialog.secondaryPurple.withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: CustomAlertDialog.primaryPurple.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: CustomAlertDialog.primaryPurple.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.download,
                    color: CustomAlertDialog.primaryPurple,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 20),

                // Title
                const Text(
                  'Downloading Update',
                  style: TextStyle(
                    color: CustomAlertDialog.textWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                // Status
                ValueListenableBuilder<String>(
                  valueListenable: downloadStatus,
                  builder: (context, status, child) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        status,
                        key: ValueKey(status),
                        style: const TextStyle(
                          color: CustomAlertDialog.textGray,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Progress Bar
                ValueListenableBuilder<double>(
                  valueListenable: downloadProgress,
                  builder: (context, progress, child) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 8,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              CustomAlertDialog.primaryPurple,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Progress percentage
                        Text(
                          '${(progress * 100).toStringAsFixed(1)}%',
                          style: const TextStyle(
                            color: CustomAlertDialog.textWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Download size info
                        ValueListenableBuilder<String>(
                          valueListenable: downloadSize,
                          builder: (context, downloaded, child) {
                            return ValueListenableBuilder<String>(
                              valueListenable: totalSize,
                              builder: (context, total, child) {
                                if (downloaded.isNotEmpty && total.isNotEmpty) {
                                  return Text(
                                    '$downloaded / $total',
                                    style: const TextStyle(
                                      color: CustomAlertDialog.textGray,
                                      fontSize: 12,
                                    ),
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),

                // Cancel button
                ValueListenableBuilder<bool>(
                  valueListenable: isDownloading,
                  builder: (context, downloading, child) {
                    if (downloading) {
                      return SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  CustomAlertDialog.errorColor.withOpacity(0.5),
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                final shouldCancel =
                                    await _showCancelConfirmationDialog(
                                        context);
                                if (shouldCancel != null &&
                                    shouldCancel == true) {
                                  cancelDownload();
                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                  }
                                }
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: const Center(
                                child: Text(
                                  'Cancel Download',
                                  style: TextStyle(
                                    color: CustomAlertDialog.errorColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: CustomAlertDialog.primaryPurple,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              borderRadius: BorderRadius.circular(12),
                              child: const Center(
                                child: Text(
                                  'Close',
                                  style: TextStyle(
                                    color: CustomAlertDialog.textWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    // Start the download
    await downloadAndInstallApk(version);

    // Close dialog when download completes (if still mounted)
    if (mainContext.mounted) {
      Navigator.of(mainContext).pop();
      await CustomAlertDialog.showSuccessDialog(
        context: mainContext,
        title: 'Download Complete',
        message:
            'The update has been downloaded successfully. Please follow the installation prompts to complete the update.',
        buttonText: 'Got it',
      );
    }
  }

  static Future<void> _tryAlternativeInstallMethod(String filePath) async {
    try {
      final result = await OpenFile.open(filePath);
      if (result.type != ResultType.done) {
        downloadStatus.value =
            'Please manually install the APK from: $filePath';
        debugPrint(
            'Alternative method also failed. Manual installation required.');
      }
    } on Exception catch (e) {
      downloadStatus.value =
          'Please manually install the APK from Downloads folder';
      debugPrint('Alternative install method error: $e');
    }
  }
}
