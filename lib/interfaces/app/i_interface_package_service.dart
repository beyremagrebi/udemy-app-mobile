import 'package:package_info_plus/package_info_plus.dart';

abstract class IPackageInfoService {
  String get currentVersion;
  PackageInfo get packageInfo;
  Future<void> initialize();
}
