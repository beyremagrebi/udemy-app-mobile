import 'package:erudaxis/interfaces/i_token_manager.dart';
import 'package:erudaxis/models/auth/login_info.dart';
import 'package:erudaxis/presentation/utils/preferences/access_token_preference.dart';
import 'package:erudaxis/presentation/utils/preferences/refresh_token_preference.dart';

class TokenManager implements ITokenManager {
  static String? accessToken;
  static String? refreshToken;

  static final TokenManager _instance = TokenManager._internal();

  static TokenManager get shared => _instance;

  TokenManager._internal();

  @override
  Future<void> load() async {
    accessToken = await AccessTokenPreference.shared.load();
    refreshToken = await RefreshTokenPreference.shared.load();
  }

  @override
  Future<void> save(
      {required String accessToken, required String refreshToken}) async {
    await AccessTokenPreference.shared.save(accessToken);
    await RefreshTokenPreference.shared.save(refreshToken);
  }

  static Future<bool> checktokenSaved() async {
    await shared.load();

    return accessToken != null;
  }

  static Future<void> saveTokens({required LoginInfo loginInfo}) async {
    if (loginInfo.accessToken != null && loginInfo.refreshToken != null) {
      await shared.save(
        accessToken: loginInfo.accessToken!,
        refreshToken: loginInfo.refreshToken!,
      );
    }
  }
}
