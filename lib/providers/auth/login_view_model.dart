import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/utils/session/app_initialize.dart';
import '../global/session_manager_view_model.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginViewModel(super.context);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    await makeApiCall(
      apiCall: AuthService.shared.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
      onSuccess: (loginInfo) async {
        await TokenManager.saveTokens(loginInfo: loginInfo);
        if (context.mounted) {
          final sessionManager =
              Provider.of<SessionManager>(context, listen: false);
          AppStarter.start(
            context,
            skipCheckUpdateVersion: true,
            sessionManager: sessionManager,
          );
        }
      },
    );
  }
}
