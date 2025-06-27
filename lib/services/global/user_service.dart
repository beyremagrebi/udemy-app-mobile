import 'package:erudaxis/core/api/api_response.dart';
import 'package:erudaxis/core/api/api_services.dart';
import 'package:erudaxis/interfaces/i_user_service.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/services/base_service.dart';

class UserService extends BaseService<User> implements IUserService {
  static final UserService _instance = UserService._internal();

  static UserService get shared => _instance;

  UserService._internal();

  @override
  User Function(dynamic json) get fromMapFunction => User.fromMap;

  @override
  Future<ApiResponse<User>> getUserById(String id) async {
    return ApiService.instance.request<User>(
      url: '$endpoint/get-user/$id',
      fromJson: fromMapFunction,
    );
  }
}
