import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/presentation/auth/login_view.dart';
import 'package:erudaxis/presentation/utils/alert_dialog.dart';
import 'package:erudaxis/presentation/utils/app/app_package_info.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:flutter/material.dart';

import '../../../providers/main/test.dart';
import '../../../services/github/github_service.dart';
import '../../main/main_view.dart';

class AppStarter {
  static Future<void> navigator(BuildContext context) async {
    final bool userHaveSession = await TokenManager.checktokenSaved();
    if (userHaveSession) {
      if (context.mounted) {
        navigateToDeleteTree(
          context,
          MainView(
            userId: TokenManager.extractIdFromToken(),
          ),
        );
      }
    } else {
      if (context.mounted) {
        navigateToDeleteTree(context, const LoginView());
      }
    }
  }

  static Future<void> start(BuildContext context) async {
    await CustomAlertDialog.showSuccessDialog(
      context: context,
      title: 'this my github token',
      message: gitHubToken,
    );
    await globalApiCall(
      apiCall: GithubService.shared.getLastRelease(),
      onSuccess: (githubRelease) async {
        if (AppPackageInfo.isAppOutdated(githubRelease)) {
          await AppPackageInfo.checkUpdateVersion(githubRelease);
        } else {
          navigator(context);
        }
      },
      onError: debugPrint,
    );
  }
}
