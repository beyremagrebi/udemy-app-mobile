import 'package:erudaxis/models/github/github_release.dart';

abstract class IUpdateDialogManager {
  Future<bool?> showCancelConfirmationDialog();
  Future<void> showDownloadProgressDialog(GithubRelease release);
  Future<void> showErrorDialog(String title, String message);
  Future<void> showPackageConflictDialog();
  Future<void> showSuccessDialog();
  Future<bool?> showUpdateAvailableDialog(GithubRelease release);
}
