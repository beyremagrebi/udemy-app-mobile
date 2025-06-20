import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool securePassword = true;
  bool isDisabled = true;
  bool? rememberMe = false;

  LoginViewModel(super.context) {
    emailController.addListener(checkInput);
    passwordController.addListener(checkInput);
  }

  void checkInput() {
    bool isValid =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

    if (isDisabled == isValid) {
      isDisabled = !isValid;
      update();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleRemmeber(bool? value) {
    rememberMe = value;
    update();
  }

  void toggleVisibility() {
    securePassword = !securePassword;
    update();
  }
}
