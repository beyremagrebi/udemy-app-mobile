import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/providers/base_view_model.dart';
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
}
