import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/presentation/auth/login_view.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/auth/auth_service.dart';
import 'package:erudaxis/services/global/user_service.dart';
import 'package:flutter/widgets.dart';

import '../../models/global/user.dart';

class SessionManager extends BaseViewModel {
  User? user;
  SessionManager(super.context);

  Future<void> loadUser() async {
    await makeApiCall(
      displayLoading: false,
      apiCall:
          UserService.shared.getUserById(TokenManager.extractIdFromToken()),
      onSuccess: (model) {
        user = model;
        update();
      },
      onError: (error) {
        throw Exception('could not initialize user');
      },
    );
  }

  Future<void> logout() async {
    await makeApiCall(
      apiCall: AuthService.shared.logout(),
      onSuccess: (model) async {
        await TokenManager.shared.clear();

        if (context.mounted) {
          navigateToDeleteTree(mainContext, const LoginView());
        }
      },
    );
  }

  Future<void> updateUser() async {
    user?.firstName = 'hello profile change it';
    Navigator.of(mainContext).pop();
    update();
    // await makeApiCall(
    //   apiCall: UserService.shared.updateUser(user!),
    //   onSuccess: (model) async {},
    // );
  }
}
