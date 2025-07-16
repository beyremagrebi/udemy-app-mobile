import 'package:erudaxis/core/api/api_response.dart';
import 'package:erudaxis/models/global/user.dart';

abstract interface class IUserService {
  Future<ApiResponse<dynamic>> changePassword(
      {required String? userId,
      required String? currentPassword,
      required String? newPassword});
  Future<ApiResponse<User>> getUserById(String id);
  Future<ApiResponse<User>> updateUser(User user, String filePath);
}
