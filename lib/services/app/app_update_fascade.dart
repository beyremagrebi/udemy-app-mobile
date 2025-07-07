import 'package:erudaxis/interfaces/app/i_download_manager.dart';
import 'package:erudaxis/interfaces/app/i_installation_manager.dart';
import 'package:erudaxis/interfaces/app/i_permession_manager.dart';
import 'package:erudaxis/models/github/github_release.dart';
import 'package:erudaxis/models/global/download_progress.dart';
import 'package:erudaxis/services/app/permession_manager.dart';
import 'package:erudaxis/services/app/update_dialog_manager.dart';

import '../../interfaces/app/i_interface_package_service.dart';
import '../../interfaces/app/i_update_download_manager.dart';
import '../../interfaces/app/i_version_checker.dart';
import 'download_manager.dart';
import 'installation_manager.dart';
import 'package_info_service.dart';
import 'update_orchestor.dart';
import 'version_checker.dart';

class AppUpdateFacade {
  static AppUpdateFacade? _instance;
  static AppUpdateFacade get instance => _instance ??= AppUpdateFacade._();

  late final UpdateOrchestrator _orchestrator;
  late final IVersionChecker _versionChecker;

  AppUpdateFacade._() {
    _initializeServices();
  }

  String get currentVersion => _orchestrator.currentVersion;

  Stream<DownloadProgress> get downloadProgressStream =>
      _orchestrator.downloadProgressStream;

  bool get isDownloading => _orchestrator.isDownloading;

  void cancelDownload() => _orchestrator.cancelDownload();

  Future<void> checkForUpdates(GithubRelease release) =>
      _orchestrator.checkForUpdates(release);

  Future<void> downloadAndInstallUpdate(GithubRelease release) =>
      _orchestrator.downloadAndInstallUpdate(release);

  // Public API
  Future<void> initialize() => _orchestrator.initialize();

  /// Check if a version is outdated without showing dialogs
  bool isVersionOutdated(String current, String latest) =>
      _versionChecker.isVersionOutdated(current, latest);
  void _initializeServices() {
    final IPackageInfoService packageInfoService = PackageInfoService();
    _versionChecker = VersionChecker();
    final IDownloadManager downloadManager = DownloadManager();
    final IPermissionManager permissionManager = PermissionManager();
    final IInstallationManager installationManager =
        InstallationManager(permissionManager);
    final IUpdateDialogManager dialogManager = UpdateDialogManager();

    _orchestrator = UpdateOrchestrator(
      packageInfoService: packageInfoService,
      versionChecker: _versionChecker,
      downloadManager: downloadManager,
      permissionManager: permissionManager,
      installationManager: installationManager,
      dialogManager: dialogManager,
    );
  }
}
