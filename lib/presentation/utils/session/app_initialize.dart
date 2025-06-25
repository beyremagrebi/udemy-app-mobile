import 'package:erudaxis/presentation/auth/login_view.dart';
import 'package:erudaxis/presentation/main/main_view.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:flutter/material.dart';

class AppStarter {
  static Future<void> start(BuildContext context) async {
    final bool userHaveSession = await TokenManager.checktokenSaved();

    if (userHaveSession) {
      if (context.mounted) {
        navigateToDeleteTree(context, const MainView());
      }
    } else {
      if (context.mounted) {
        navigateToDeleteTree(context, const LoginView());
      }
    }
  }
}
