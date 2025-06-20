import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/material.dart';

import '../../presentation/utils/form/validate_helper.dart';

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

  void toggleRemember(bool? value) {
    rememberMe = value;
    update();
  }

  void toggleVisibility() {
    securePassword = !securePassword;
    update();
  }

  void _onInputChanged() {
    final isValid =
        ValidationHelpers.validateEmail(emailController.text) == null &&
            ValidationHelpers.validatePassword(passwordController.text) == null;

    // Only update if state has changed
    if (isDisabled == isValid) {
      isDisabled = !isValid;
      update();
    }
  }
}
