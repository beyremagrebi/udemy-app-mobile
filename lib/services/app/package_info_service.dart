import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../interfaces/app/i_interface_package_service.dart';

class PackageInfoService implements IPackageInfoService {
  PackageInfo? _packageInfo;
  String _currentVersion = '1.0.0';

  @override
  String get currentVersion => _currentVersion;

  @override
  PackageInfo get packageInfo => _packageInfo!;

  @override
  Future<void> initialize() async {
    try {
      _packageInfo = await PackageInfo.fromPlatform();
      _currentVersion = _packageInfo!.version;
    } on Exception catch (e) {
      debugPrint('Failed to initialize package info: $e');
      _currentVersion = '1.0.0';
    }
  }
}
