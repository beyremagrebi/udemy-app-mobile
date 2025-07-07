import 'dart:io';

import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/models/github/github_release.dart';
import 'package:flutter/material.dart';

import '../../interfaces/app/i_update_download_manager.dart';
import '../../presentation/utils/alert_dialog.dart';
import '../../presentation/utils/app/app_package_info.dart';

class UpdateDialogManager implements IUpdateDialogManager {
  @override
  Future<bool?> showCancelConfirmationDialog() async {
    return showDialog<bool>(
      context: mainContext,
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

  @override
  Future<void> showDownloadProgressDialog(GithubRelease release) async {
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
              border: Border.all(color: Colors.white.withOpacity(0.2)),
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
                  valueListenable: AppPackageInfo.downloadStatus,
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
                  valueListenable: AppPackageInfo.downloadProgress,
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
                          valueListenable: AppPackageInfo.downloadSize,
                          builder: (context, downloaded, child) {
                            return ValueListenableBuilder<String>(
                              valueListenable: AppPackageInfo.totalSize,
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
                  valueListenable: AppPackageInfo.isDownloading,
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
                                    await showCancelConfirmationDialog();
                                if (shouldCancel != null &&
                                    shouldCancel == true) {
                                  AppPackageInfo.cancelDownload();
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
  }

  @override
  Future<void> showErrorDialog(String title, String message) async {
    if (message.contains('package conflicts') ||
        message.contains('Package conflict detected')) {
      await showPackageConflictDialog();
    } else {
      await CustomAlertDialog.showErrorDialog(
        context: mainContext,
        title: title,
        message: message,
      );
    }
  }

  @override
  Future<void> showPackageConflictDialog() async {
    return showDialog<void>(
      context: mainContext,
      barrierDismissible: false,
      builder: (context) {
        return CustomAlertDialog.buildCustomDialog(
          context: context,
          icon: Icons.warning,
          iconColor: CustomAlertDialog.warningColor,
          title: 'Installation Conflict',
          message:
              'The update cannot be installed because it conflicts with the current version.\n\n'
              "This usually happens when app signatures don't match.\n\n"
              'Please uninstall the current app first:\n'
              '1. Go to Settings > Apps\n'
              '2. Find and select "erudaxis"\n'
              '3. Tap "Uninstall"\n'
              '4. Then retry the update',
          primaryButtonText: 'Open Settings',
          primaryButtonColor: CustomAlertDialog.primaryPurple,
          secondaryButtonText: 'Cancel',
          onPrimaryPressed: () {
            Navigator.of(context).pop();
            _openAppSettings();
          },
          onSecondaryPressed: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Future<void> showSuccessDialog() async {
    await CustomAlertDialog.showSuccessDialog(
      context: mainContext,
      title: 'Download Complete',
      message:
          'The update has been downloaded successfully. Please follow the installation prompts to complete the update.',
      buttonText: 'Got it',
    );
  }

  @override
  Future<bool?> showUpdateAvailableDialog(GithubRelease release) async {
    return showDialog<bool>(
      context: mainContext,
      barrierDismissible: false,
      builder: (context) {
        return CustomAlertDialog.buildCustomDialog(
          context: mainContext,
          icon: Icons.system_update,
          iconColor: CustomAlertDialog.primaryPurple,
          title: 'Update Available',
          message:
              'Version ${release.version} is now available!\nCurrent version: ${release.version}\n\nWould you like to download and install the update now?',
          primaryButtonText: 'Update Now',
          primaryButtonColor: CustomAlertDialog.primaryPurple,
          secondaryButtonText: 'Not Now',
          onPrimaryPressed: () => Navigator.of(context).pop(true),
          onSecondaryPressed: () => Navigator.of(context).pop(false),
        );
      },
    );
  }

  Future<void> _openAppSettings() async {
    try {
      // Try to open app settings
      await Process.run('am', [
        'start',
        '-a', 'android.settings.APPLICATION_DETAILS_SETTINGS',
        '-d',
        'package:com.yourpackage.erudaxis' // Replace with your actual package name
      ]);
    } on Exception catch (e) {
      debugPrint('Could not open app settings: $e');
    }
  }
}
