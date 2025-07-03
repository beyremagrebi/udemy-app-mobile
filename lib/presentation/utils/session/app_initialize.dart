import 'package:erudaxis/presentation/auth/login_view.dart';
import 'package:erudaxis/presentation/utils/app/app_package_info.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/main/test.dart';
import 'package:flutter/material.dart';

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
    await globalApiCall(
      apiCall: GithubService.shared.getLastRelease(),
      onSuccess: (model) async {
        await AppPackageInfo.checkUpdateVersion(model.name, context);
        // await navigator(context);
      },
      onError: (error) {
        print('hello $error');
      },
    );
  }
}
