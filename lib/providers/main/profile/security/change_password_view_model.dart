import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/presentation/utils/snackbar_utils.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/global/user_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constant.dart';
import '../../../../presentation/utils/form/validate_helper.dart';

class ChangePasswordViewModel extends BaseViewModel {
  bool obsecureCurrenPassword = true;
  bool obsecureNewPassword = true;
  bool obsecureConfirmPassword = true;
  bool success = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final FieldValidator currentPasswordValidator;
  late final FieldValidator newPasswordValidator;
  late final FieldValidator confirmPasswordValidator;
  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();
  ChangePasswordViewModel(super.context) {
    currentPasswordValidator = CompositeValidator([
      RequiredValidator(fieldName: intl.passwordField),
      PasswordValidator(),
    ]);

    newPasswordValidator = CompositeValidator([
      RequiredValidator(fieldName: intl.passwordField),
      PasswordValidator(),
    ]);

    confirmPasswordValidator = MatchValidator(
      matchFieldGetter: () => newPasswordController.text,
    );

    newPasswordController.addListener(() {
      if (confirmPassword.text.isNotEmpty) {
        update();
      }
    });
  }
  Future<void> changePassword() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    final String userId = TokenManager.extractIdFromToken();
    await makeApiCall(
      apiCall: UserService.shared.changePassword(
        userId: userId,
        currentPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      ),
      onSuccess: (model) {
        SnackBarUtils.showSuccess(context, intl.password_changed_success);
      },
    );
  }

  void toggleObsecureConfirmPassword() {
    obsecureConfirmPassword = !obsecureConfirmPassword;
    update();
  }

  void toggleObsecureCurrenPassword() {
    obsecureCurrenPassword = !obsecureCurrenPassword;
    update();
  }

  void toggleObsecureNewPassword() {
    obsecureNewPassword = !obsecureNewPassword;
    update();
  }
}
