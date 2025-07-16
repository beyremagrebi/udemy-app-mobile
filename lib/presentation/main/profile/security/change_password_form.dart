import 'package:erudaxis/providers/main/profile/security/change_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../widgets/common/form/input_text.dart';
import '../../../../widgets/common/gradient_button.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ChangePasswordViewModel.new,
      child: Consumer<ChangePasswordViewModel>(
        builder: (context, viewModel, child) => Card(
          elevation: 0,
          child: Container(
            width: double.maxFinite,
            padding: Dimensions.paddingAllMedium,
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    intl.change_password,
                    style: textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Dimensions.heightMedium,
                  InputText(
                    controller: viewModel.currentPasswordController,
                    hintText: intl.current_password,
                    validator: viewModel.currentPasswordValidator.validate,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    label: intl.current_password,
                    required: true,
                    obscureText: viewModel.obsecureCurrenPassword,
                    suffixIcon: IconButton(
                      onPressed: viewModel.toggleObsecureCurrenPassword,
                      icon: Icon(
                        viewModel.obsecureCurrenPassword == false
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Dimensions.heightMedium,
                  InputText(
                    controller: viewModel.newPasswordController,
                    hintText: intl.new_password,
                    label: intl.new_password,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    required: true,
                    validator: viewModel.newPasswordValidator.validate,
                    obscureText: viewModel.obsecureNewPassword,
                    suffixIcon: IconButton(
                      onPressed: viewModel.toggleObsecureNewPassword,
                      icon: Icon(
                        viewModel.obsecureNewPassword == false
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Dimensions.heightMedium,
                  InputText(
                    controller: viewModel.confirmPassword,
                    hintText: intl.confirm_new_password,
                    autovalidateMode: AutovalidateMode.always,
                    label: intl.confirm_new_password,
                    validator: viewModel.confirmPasswordValidator.validate,
                    required: true,
                    obscureText: viewModel.obsecureConfirmPassword,
                    suffixIcon: IconButton(
                      onPressed: viewModel.toggleObsecureConfirmPassword,
                      icon: Icon(
                        viewModel.obsecureConfirmPassword == false
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Dimensions.heightExtraLarge,
                  GradientButton(
                    text: intl.change_password,
                    onPressed: viewModel.changePassword,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
