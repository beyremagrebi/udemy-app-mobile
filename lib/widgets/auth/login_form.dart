import 'package:erudaxis/providers/auth/login_view_model.dart';
import 'package:flutter/material.dart';

import '../../core/styles/dimensions.dart';
import '../../presentation/main/main_view.dart';
import '../../presentation/utils/navigator_utils.dart';
import '../common/form/input_text.dart';
import '../common/gradient_button.dart';
import 'login_footer_row.dart';

class LoginForm extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginForm({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputText(
          controller: viewModel.emailController,
          hintText: 'Enter email',
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: Colors.grey,
            size: 20,
          ),
        ),
        Dimensions.heightMedium,
        InputText(
          controller: viewModel.passwordController,
          hintText: 'Enter password',
          keyboardType: TextInputType.visiblePassword,
          obscureText: viewModel.securePassword,
          suffixIcon: IconButton(
            onPressed: () {
              viewModel.toggleVisibility();
            },
            icon: const Icon(
              Icons.visibility_outlined,
              size: 20,
              color: Colors.grey,
            ),
          ),
          prefixIcon: const Icon(
            Icons.lock_outlined,
            size: 20,
            color: Colors.grey,
          ),
        ),
        Dimensions.heightMedium,
        LoginFooterRow(
          viewModel: viewModel,
        ),
        Dimensions.heightMedium,
        GradientButton(
          width: double.maxFinite,
          text: 'Login',
          isDisabled: viewModel.isDisabled,
          onPressed: () {
            navigateTo(context, const MainView());
          },
        )
      ],
    );
  }
}
