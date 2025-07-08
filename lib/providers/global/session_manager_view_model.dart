import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/presentation/auth/login_view.dart';
import 'package:erudaxis/presentation/utils/navigator_utils.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/auth/auth_service.dart';
import 'package:erudaxis/services/global/user_service.dart';

class SessionManager extends BaseViewModel {
  User? user;
  final String userId;
  bool isLoding = false;
  SessionManager(super.context, {required this.userId}) {
    loadUser();
  }

  Future<void> loadUser() async {
    if (isLoding) {
      return;
    }
    await makeApiCall(
      displayLoading: false,
      apiCall: UserService.shared.getUserById(userId),
      onSuccess: (model) {
        user = model;
        isLoding = true;
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
          navigateTo(context, const LoginView());
        }
      },
    );
  }
}
