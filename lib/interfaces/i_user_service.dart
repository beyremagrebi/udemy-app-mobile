import 'package:erudaxis/core/api/api_response.dart';
import 'package:erudaxis/models/global/user.dart';

abstract interface class IUserService {
  Future<ApiResponse<User>> getUserById(String id);
}
