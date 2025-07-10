import 'package:erudaxis/presentation/auth/login_view.dart';
import 'package:erudaxis/presentation/utils/app/app_package_info.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:flutter/material.dart';

import '../../../providers/main/test.dart';
import '../../../services/github/github_service.dart';
import '../../main/main_view.dart';

class AppStarter {
  static Future<void> navigator(
    BuildContext context,
    SessionManager sessionManager,
  ) async {
    final bool userHaveSession = await TokenManager.checktokenSaved();
    if (userHaveSession) {
      await sessionManager.loadUser();
      if (context.mounted) {
        navigateToDeleteTree(
          context,
          const MainView(),
        );
      }
    } else {
      if (context.mounted) {
        navigateToDeleteTree(context, const LoginView());
      }
    }
  }

  static Future<void> start(
    BuildContext context, {
    required SessionManager sessionManager,
    bool skipCheckUpdateVersion = false,
  }) async {
    if (skipCheckUpdateVersion) {
      navigator(context, sessionManager);
    } else {
      await globalApiCall(
        apiCall: GithubService.shared.getLastRelease(),
        onSuccess: (githubRelease) async {
          if (AppPackageInfo.isAppOutdated(githubRelease)) {
            await AppPackageInfo.checkUpdateVersion(githubRelease);
          } else {
            navigator(context, sessionManager);
          }
        },
        onError: debugPrint,
      );
    }
  }
}
