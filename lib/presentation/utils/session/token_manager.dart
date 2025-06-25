import 'package:erudaxis/interfaces/i_token_manager.dart';
import 'package:erudaxis/presentation/utils/preferences/access_token_preference.dart';
import 'package:erudaxis/presentation/utils/preferences/refresh_token_preference.dart';

class TokenManager implements ITokenManager {
  static String? accessToken;
  static String? refreshTojen;

  static final TokenManager _instance = TokenManager._internal();

  static TokenManager get shared => _instance;

  TokenManager._internal();

  @override
  Future<void> load() async {
    accessToken = await AccessTokenPreference.shared.load();
    refreshTojen = await RefreshTokenPreference.shared.load();
  }

  @override
  Future<void> save() async {
    await AccessTokenPreference.shared.load();
    await RefreshTokenPreference.shared.load();
  }
}
