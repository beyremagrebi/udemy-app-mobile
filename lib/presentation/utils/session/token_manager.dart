import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/interfaces/i_token_manager.dart';
import 'package:erudaxis/models/auth/login_info.dart';
import 'package:erudaxis/presentation/utils/preferences/access_token_preference.dart';
import 'package:erudaxis/presentation/utils/preferences/refresh_token_preference.dart';
import 'package:erudaxis/presentation/utils/snackbar_utils.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:erudaxis/providers/main/test.dart';
import 'package:erudaxis/services/auth/auth_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

class TokenManager implements ITokenManager {
  static String? accessToken;
  static String? refreshToken;

  static final TokenManager _instance = TokenManager._internal();

  static TokenManager get shared => _instance;

  TokenManager._internal();
  @override
  Future<void> clear() async {
    await AccessTokenPreference.shared.remove();
    await RefreshTokenPreference.shared.remove();
  }

  @override
  Map<String, dynamic> decode(String? token) {
    if (token == null || token.isEmpty) {
      throw Exception('Token is null or empty');
    }
    final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    return decodedToken;
  }

  @override
  Future<void> load() async {
    accessToken = await AccessTokenPreference.shared.load();
    refreshToken = await RefreshTokenPreference.shared.load();
  }

  @override
  Future<String?> refreshTken() async {
    String? refreshAccessToken;
    await globalApiCall(
      apiCall: AuthService.shared.refreshToken(
        refreshToken: refreshToken,
      ),
      onSuccess: (loginInfo) async {
        if (loginInfo.accessToken != null && loginInfo.refreshToken != null) {
          refreshAccessToken = loginInfo.accessToken;
          await updateTokens(
            newAccessToken: loginInfo.accessToken!,
            newRefreshToken: loginInfo.refreshToken!,
          );
        }
      },
      onError: (error) {
        mainContext.read<SessionManager>().logout().whenComplete(() {
          SnackBarUtils.showSuccess(mainContext, 'Session Expired');
        });
      },
    );
    return refreshAccessToken;
  }

  @override
  Future<void> save({
    required String accessToken,
    required String refreshToken,
  }) async {
    await AccessTokenPreference.shared.save(accessToken);
    await RefreshTokenPreference.shared.save(refreshToken);
  }

  Future<void> updateTokens({
    required String newAccessToken,
    required String newRefreshToken,
  }) async {
    accessToken = newAccessToken;
    refreshToken = newRefreshToken;

    await save(
      accessToken: newAccessToken,
      refreshToken: newRefreshToken,
    );
  }

  static Future<bool> checktokenSaved() async {
    await shared.load();

    return accessToken != null;
  }

  static String extractIdFromToken() {
    return shared.decode(accessToken)['_id'].toString();
  }

  static Future<void> saveTokens({
    required LoginInfo loginInfo,
  }) async {
    if (loginInfo.accessToken != null && loginInfo.refreshToken != null) {
      await shared.save(
        accessToken: loginInfo.accessToken!,
        refreshToken: loginInfo.refreshToken!,
      );
    }
  }
}
