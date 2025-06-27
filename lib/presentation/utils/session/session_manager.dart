import 'package:erudaxis/interfaces/i_session_user_manager.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/presentation/utils/session/token_manager.dart';
import 'package:erudaxis/services/global/user_service.dart';

import '../../../providers/main/test.dart';

class SessionManager implements ISessionUserManager {
  static User? user;

  static final SessionManager _instance = SessionManager._internal();

  static SessionManager get shared => _instance;

  SessionManager._internal();

  @override
  String getIdOfUser() {
    return TokenManager.shared
        .decode(TokenManager.accessToken)['_id']
        .toString();
  }

  @override
  Future<void> getUserById() async {
    if (getIdOfUser().isEmpty) {
      throw Exception('user ID is empty');
    }
    await globalApiCall(
      apiCall: UserService.shared.getUserById(
        getIdOfUser(),
      ),
      onSuccess: (model) {
        user = model;
      },
      onError: (error) {
        throw Exception('Session begin with user null');
      },
    );
  }

  static Future<void> initialize() async {
    await shared.getUserById();
  }
}
