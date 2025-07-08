import 'package:erudaxis/interfaces/i_auth_service.dart';
import 'package:erudaxis/models/auth/login_info.dart';
import 'package:erudaxis/services/base_service.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';
import '../../interfaces/i_api_service.dart';

class AuthService extends BaseService<LoginInfo> implements IAuthService {
  static final AuthService _instance = AuthService._internal();

  static AuthService get shared => _instance;

  AuthService._internal();
  @override
  LoginInfo Function(dynamic json) get fromMapFunction => LoginInfo.fromMap;

  @override
  Future<ApiResponse<LoginInfo>> login({
    required String? email,
    required String? password,
  }) async {
    return ApiService.instance.request<LoginInfo>(
      url: '$endpoint/login',
      authRequired: false,
      fromJson: fromMapFunction,
      method: DioMethod.post,
      data: {'email': '$email', 'password': '$password'},
    );
  }

  @override
  Future<ApiResponse<dynamic>> logout() async {
    return ApiService.instance.request<dynamic>(
      url: '$endpoint/logout',
      fromJson: (dynamic) => dynamic,
      method: DioMethod.delete,
    );
  }

  @override
  Future<ApiResponse<LoginInfo>> refreshToken(
      {required String? refreshToken}) async {
    return ApiService.instance.request<LoginInfo>(
      url: '$endpoint/refresh-token',
      fromJson: fromMapFunction,
      authRequired: false,
      method: DioMethod.post,
      data: {'refreshToken': refreshToken},
    );
  }
}
