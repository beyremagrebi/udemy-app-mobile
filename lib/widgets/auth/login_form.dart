import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/providers/auth/login_view_model.dart';
import 'package:erudaxis/providers/auth/validator_view_model.dart';
import 'package:erudaxis/providers/auth/visibilty_field_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/styles/dimensions.dart';
import '../../presentation/utils/form/base_form.dart';
import '../common/form/input_text.dart';
import '../common/gradient_button.dart';
import 'login_footer_row.dart';

class LoginForm extends BaseForm<LoginViewModel> {
  final ValidatorViewModel validatorViewModel;
  LoginForm({
    required super.viewModel,
    required this.validatorViewModel,
    super.key,
  });

  @override
  Widget? buildFooter(BuildContext context) {
    return const LoginFooterRow();
  }

  @override
  List<Widget> buildFormFields(BuildContext context) {
    return [
      InputText(
        controller: viewModel.emailController,
        hintText: intl.enterEmail,
        validator: validatorViewModel.emailValidator.validate,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        prefixIcon:
            Icon(Icons.email_outlined, color: Colors.grey.shade100, size: 20),
      ),
      Dimensions.heightMedium,
      ChangeNotifierProvider(
        create: VisibiltyFieldPasswordViewModel.new,
        child: Consumer<VisibiltyFieldPasswordViewModel>(
          builder: (context, visibiltyFieldPasswordViewModel, child) =>
              InputText(
            controller: viewModel.passwordController,
            hintText: intl.enterPassword,
            keyboardType: TextInputType.visiblePassword,
            obscureText: visibiltyFieldPasswordViewModel.securePassword,
            validator: validatorViewModel.passwordValidator.validate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            suffixIcon: IconButton(
              onPressed: visibiltyFieldPasswordViewModel.toggleVisibility,
              icon: Icon(
                visibiltyFieldPasswordViewModel.securePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 20,
                color: Colors.grey.shade100,
              ),
            ),
            prefixIcon: Icon(Icons.lock_outlined,
                size: 20, color: Colors.grey.shade100),
          ),
        ),
      ),
    ];
  }

  @override
  Widget buildSubmitButton(BuildContext context) {
    return GradientButton(
      width: double.maxFinite,
      text: intl.login,
      onPressed: () {
        if (validateForm()) {
          onSubmit(context);
        }
      },
    );
  }

  @override
  void onSubmit(BuildContext context) {
    viewModel.login();
  }
}
