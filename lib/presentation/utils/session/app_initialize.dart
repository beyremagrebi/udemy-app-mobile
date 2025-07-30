import 'package:erudaxis/core/enum/role.dart';
import 'package:erudaxis/presentation/admin/facility_view.dart';
import 'package:erudaxis/presentation/auth/login_view.dart';
import 'package:erudaxis/presentation/utils/app/app_package_info.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';
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
    if (!userHaveSession) {
      if (context.mounted) {
        navigateToDeleteTree(context, const LoginView());
        return;
      }
    }
    await sessionManager.loadUser();

    if (context.mounted) {
      final user = sessionManager.user;
      switch (user?.role) {
        case Role.superAdmin:
        case Role.companyAdmin:
          if (await FacilityManager.checkFacilityExist()) {
            final facilityId = await FacilityManager.load();
            if (context.mounted) {
              safeNavigateToMainScreen(
                  context: context, sm: sessionManager, facilityId: facilityId);
            }
          } else {
            if (context.mounted) {
              navigateToDeleteTree(
                context,
                FacilityView(
                  sessionManager: sessionManager,
                ),
              );
            }
          }

        default:
          safeNavigateToMainScreen(
            context: context,
            sm: sessionManager,
            facilityId: user?.facility?.id,
          );
      }
    }
  }

  static Future<void> safeNavigateToMainScreen(
      {required BuildContext context,
      required SessionManager sm,
      String? facilityId}) async {
    await sm.loadFacility(facilityId);
    if (context.mounted) {
      navigateToDeleteTree(
        context,
        const MainView(),
      );
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
