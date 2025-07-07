abstract class IPermissionManager {
  Future<bool> hasInstallPermission();
  Future<void> openInstallPermissionSettings();
  Future<bool> requestAllPermissions();
}
