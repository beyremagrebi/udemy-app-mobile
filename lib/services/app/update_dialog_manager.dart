import 'dart:io';

import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:erudaxis/models/github/github_release.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/constant.dart';
import '../../interfaces/app/i_update_download_manager.dart';
import '../../presentation/utils/alert_dialog.dart';
import '../../presentation/utils/app/app_package_info.dart';
import '../../providers/main/profile/theme/theme_view_model.dart';

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
          title: intl.cancelDownloadTitle,
          message: intl.cancelDownloadMessage,
          primaryButtonText: intl.cancelDownloadButton,
          primaryButtonColor: CustomAlertDialog.errorColor,
          secondaryButtonText: intl.continueDownloadButton,
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
        final themeViewModel = context.watch<ThemeViewModel>();
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
                  themeViewModel.currentTheme.primary.withOpacity(0.9),
                  themeViewModel.currentTheme.secondary.withOpacity(0.9),
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
                    color: themeViewModel.currentTheme.primary.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          themeViewModel.currentTheme.primary.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.download,
                    color: themeViewModel.currentTheme.primary,
                    size: 32,
                  ),
                ),
                Dimensions.heightExtraLarge,
                // Title
                Text(
                  intl.downloadingUpdateTitle,
                  style: const TextStyle(
                    color: CustomAlertDialog.textWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Dimensions.heightMedium,
                // Status
                ValueListenableBuilder<String>(
                  valueListenable: AppPackageInfo.downloadStatus,
                  builder: (context, status, child) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        status.isEmpty ? intl.downloadingStatus : status,
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
                Dimensions.heightExtraLarge,
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
                            valueColor: AlwaysStoppedAnimation<Color>(
                              themeViewModel.currentTheme.primary,
                            ),
                          ),
                        ),
                        Dimensions.heightMedium,
                        // Progress percentage
                        Text(
                          '${(progress * 100).toStringAsFixed(1)}%',
                          style: const TextStyle(
                            color: CustomAlertDialog.textWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Dimensions.heightSmall,
                        // Download size info
                        ValueListenableBuilder<String>(
                          valueListenable: AppPackageInfo.downloadSize,
                          builder: (context, downloaded, child) {
                            return ValueListenableBuilder<String>(
                              valueListenable: AppPackageInfo.totalSize,
                              builder: (context, total, child) {
                                if (downloaded.isNotEmpty && total.isNotEmpty) {
                                  return Container(
                                    alignment: Alignment.center,
                                    child: Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            downloaded,
                                            style: const TextStyle(
                                              color: CustomAlertDialog.textGray,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const Text(
                                            ' / ',
                                            style: TextStyle(
                                              color: CustomAlertDialog.textGray,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            total,
                                            style: const TextStyle(
                                              color: CustomAlertDialog.textGray,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
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
                Dimensions.heightHuge,
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
                              child: Center(
                                child: Text(
                                  intl.cancelDownloadButton,
                                  style: const TextStyle(
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
                            color: themeViewModel.currentTheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              borderRadius: BorderRadius.circular(12),
                              child: Center(
                                child: Text(
                                  intl.closeButton,
                                  style: const TextStyle(
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
        final themeViewModel = context.watch<ThemeViewModel>();
        return CustomAlertDialog.buildCustomDialog(
          context: context,
          icon: Icons.warning,
          iconColor: CustomAlertDialog.warningColor,
          title: intl.installationConflictTitle,
          message: intl.installationConflictMessage,
          primaryButtonText: intl.openSettingsButton,
          primaryButtonColor: themeViewModel.currentTheme.primary,
          secondaryButtonText: intl.cancelButton,
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
      title: intl.downloadCompleteTitle,
      message: intl.downloadCompleteMessage,
      buttonText: intl.gotItButton,
    );
  }

  @override
  Future<bool?> showUpdateAvailableDialog(GithubRelease release) async {
    return showDialog<bool>(
      context: mainContext,
      barrierDismissible: false,
      builder: (context) {
        final themeViewModel = context.watch<ThemeViewModel>();
        return CustomAlertDialog.buildCustomDialog(
          context: context,
          icon: Icons.system_update,
          iconColor: themeViewModel.currentTheme.primary,
          title: intl.updateAvailableTitle,
          message: intl.updateAvailableMessage(
            release.version.toString(),
            AppPackageInfo.appVersion,
          ),
          primaryButtonText: intl.updateNowButton,
          primaryButtonColor: themeViewModel.currentTheme.primary,
          secondaryButtonText: intl.notNowButton,
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
        '-a',
        'android.settings.APPLICATION_DETAILS_SETTINGS',
        '-d',
        'package:com.yourpackage.erudaxis'
      ]);
    } on Exception catch (e) {
      debugPrint('Could not open app settings: $e');
    }
  }
}
