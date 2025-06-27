import 'package:erudaxis/core/api/api_response.dart';

abstract class IAuthService {
  Future<ApiResponse<dynamic>> login(
      {required String email, required String password});
  Future<ApiResponse<dynamic>> refreshToken({required String? refreshToken});
}
