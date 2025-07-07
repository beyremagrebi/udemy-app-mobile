import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import '../../interfaces/app/i_installation_manager.dart';
import '../../interfaces/app/i_permession_manager.dart';

class InstallationManager implements IInstallationManager {
  final IPermissionManager _permissionManager;

  InstallationManager(this._permissionManager);

  @override
  Future<void> installApk(String filePath) async {
    try {
      final file = File(filePath);
      final fileExist = await file.exists();
      if (!fileExist) {
        throw Exception('APK file not found');
      }

      final fileSize = await file.length();
      if (fileSize < 1024) {
        throw Exception('APK file appears to be corrupted');
      }

      if (!await _permissionManager.hasInstallPermission()) {
        await _permissionManager.openInstallPermissionSettings();
        throw Exception(
            'Install permission required. Please enable "Install unknown apps" in settings.');
      }

      // First attempt: Try direct installation
      final result = await OpenFile.open(
        filePath,
        type: 'application/vnd.android.package-archive',
      );

      switch (result.type) {
        case ResultType.done:
          debugPrint('Installer opened successfully');
          break;
        case ResultType.noAppToOpen:
          await _tryAlternativeInstallMethod(filePath);
          break;
        case ResultType.permissionDenied:
          await _permissionManager.openInstallPermissionSettings();
          throw Exception(
              'Permission denied. Please enable "Install unknown apps"');
        case ResultType.error:
        default:
          // If installation fails, it might be due to package conflict
          await _handlePackageConflict(filePath);
          break;
      }
    } on Exception catch (e) {
      debugPrint('Installation error: $e');

      // Check if it's a package conflict error
      if (e.toString().contains('package conflicts') ||
          e.toString().contains('INSTALL_FAILED_UPDATE_INCOMPATIBLE')) {
        await _handlePackageConflict(filePath);
      } else {
        rethrow;
      }
    }
  }

  Future<void> _handlePackageConflict(String filePath) async {
    // Show dialog explaining the conflict and asking user to uninstall first
    throw Exception(
        'Package conflict detected. Please uninstall the current version of the app first, then try installing the update again.\n\n'
        "This usually happens when the app signatures don't match. "
        'Go to Settings > Apps > erudaxis > Uninstall, then retry the update.');
  }

  Future<void> _tryAlternativeInstallMethod(String filePath) async {
    try {
      final result = await OpenFile.open(filePath);
      if (result.type != ResultType.done) {
        throw Exception('Please manually install the APK from: $filePath');
      }
    } on Exception catch (e) {
      debugPrint('Alternative install method error: $e');
      throw Exception('Please manually install the APK from Downloads folder');
    }
  }
}
