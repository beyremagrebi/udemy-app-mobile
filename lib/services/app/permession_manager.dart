import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:erudaxis/interfaces/app/i_permession_manager.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager implements IPermissionManager {
  @override
  Future<bool> hasInstallPermission() async {
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

  @override
  Future<void> openInstallPermissionSettings() async {
    try {
      await Permission.requestInstallPackages.request();
    } on Exception catch (e) {
      debugPrint('Error opening install permission settings: $e');
    }
  }

  @override
  Future<bool> requestAllPermissions() async {
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

  Future<bool> _requestInstallPermission() async {
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

  Future<bool> _requestStoragePermission() async {
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
}
