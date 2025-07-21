import 'package:erudaxis/core/api/api_response.dart';

abstract interface class IAuthService {
  Future<ApiResponse<dynamic>> login(
      {required String email, required String password});
  Future<ApiResponse<dynamic>> logout();
  Future<ApiResponse<dynamic>> refreshToken({required String? refreshToken});
}
