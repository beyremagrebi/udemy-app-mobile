import 'package:erudaxis/core/api/api_response.dart';
import 'package:erudaxis/core/api/api_services.dart';
import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/interfaces/i_api_service.dart';
import 'package:erudaxis/interfaces/i_user_service.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/services/base_service.dart';

class UserService extends BaseService<User> implements IUserService {
  static final UserService _instance = UserService._internal();

  static UserService get shared => _instance;

  UserService._internal();

  @override
  String get endpoint => '${super.endpoint}/users';

  @override
  User Function(dynamic json) get fromMapFunction => User.fromMap;
  @override
  Future<ApiResponse<User>> getUserById(String id) async {
    return ApiService.instance.request<User>(
      url: '$endpoint/by-id',
      queryParameters: {'_id': id},
      dataKey: 'data',
      fromJson: fromMapFunction,
    );
  }

  @override
  Future<ApiResponse<User>> updateUser(User user) {
    return ApiService.instance.multipartRequest(
      url: '$baseURl/update-profile/${user.id}',
      fromJson: fromMapFunction,
      method: DioMethod.patch,
      formData: user.toFormData(),
    );
  }
}
