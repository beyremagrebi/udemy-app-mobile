import 'package:erudaxis/models/auth/login_info.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../../presentation/main/main_view.dart';
import '../../presentation/utils/navigator_utils.dart';

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
      fromData: LoginInfo.fromMap,
      apiCall: AuthService.shared.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
      onSuccess: (model) {
        navigateToDeleteTree(context, const MainView());
      },
    );
  }
}
