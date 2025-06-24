import 'package:erudaxis/models/auth/login_info.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../../presentation/main/main_view.dart';
import '../../presentation/utils/form/validate_helper.dart';
import '../../presentation/utils/navigator_utils.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool securePassword = true;
  bool isDisabled = true;
  bool? rememberMe = false;

  LoginViewModel(super.context) {
    // Listen to input changes to update button state
    emailController.addListener(_onInputChanged);
    passwordController.addListener(_onInputChanged);
  }

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

  void toggleRemember({bool? value}) {
    rememberMe = value;
    update();
  }

  void toggleVisibility() {
    securePassword = !securePassword;
    update();
  }

  void _onInputChanged() {
    final isValid =
        ValidationHelpers.validateEmail(emailController.text.trim()) == null &&
            ValidationHelpers.validatePassword(
                  passwordController.text.trim(),
                ) ==
                null;

    if (isDisabled == isValid) {
      isDisabled = !isValid;
      update();
    }
  }
}
