import 'package:erudaxis/presentation/main/main_view.dart';
import 'package:erudaxis/providers/auth/login_view_model.dart';
import 'package:flutter/material.dart';

import '../../core/styles/dimensions.dart';
import '../../presentation/utils/form/base_form.dart';
import '../../presentation/utils/form/validate_helper.dart';
import '../../presentation/utils/navigator_utils.dart';
import '../common/form/input_text.dart';
import '../common/gradient_button.dart';
import 'login_footer_row.dart';

class LoginForm extends BaseForm<LoginViewModel> {
  LoginForm({required super.viewModel, super.key});

  @override
  Widget? buildFooter(BuildContext context) {
    return LoginFooterRow(viewModel: viewModel);
  }

  @override
  List<Widget> buildFormFields(BuildContext context) {
    return [
      InputText(
        controller: viewModel.emailController,
        hintText: 'Enter email',
        validator: ValidationHelpers.validateEmail,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        prefixIcon:
            Icon(Icons.email_outlined, color: Colors.grey.shade100, size: 20),
      ),
      Dimensions.heightMedium,
      InputText(
        controller: viewModel.passwordController,
        hintText: 'Enter password',
        keyboardType: TextInputType.visiblePassword,
        obscureText: viewModel.securePassword,
        validator: ValidationHelpers.validatePassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        suffixIcon: IconButton(
          onPressed: viewModel.toggleVisibility,
          icon: Icon(
            viewModel.securePassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 20,
            color: Colors.grey.shade100,
          ),
        ),
        prefixIcon:
            Icon(Icons.lock_outlined, size: 20, color: Colors.grey.shade100),
      ),
    ];
  }

  @override
  Widget buildSubmitButton(BuildContext context) {
    return GradientButton(
      width: double.maxFinite,
      text: 'Login',
      isDisabled: viewModel.isDisabled,
      onPressed: () {
        if (validateForm()) {
          onSubmit(context);
        }
      },
    );
  }

  @override
  void onSubmit(BuildContext context) {
    navigateTo(context, const MainView());
  }
}
