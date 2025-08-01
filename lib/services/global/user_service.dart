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
  Future<ApiResponse<dynamic>> changePassword({
    required String? userId,
    required String? currentPassword,
    required String? newPassword,
  }) async {
    return ApiService.instance.request(
      url: '$baseURl/password/$userId',
      fromJson: fromMapFunction,
      method: DioMethod.put,
      data: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      },
    );
  }

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
  Future<ApiResponse<User>> updateFcmTOken(String? id, String? fcmToken) async {
    return ApiService.instance.request<User>(
      method: DioMethod.patch,
      url: '${super.endpoint}/update-fcm-token/$id',
      fromJson: fromMapFunction,
    );
  }

  @override
  Future<ApiResponse<User>> updateUser(User user, String filePath) {
    return ApiService.instance.uploadFile(
      url: '$baseURl/update-profile/${user.id}',
      fromJson: fromMapFunction,
      method: DioMethod.patch,
      dataKey: 'user',
      formData: user.toFormData(),
      filePath: filePath,
      fieldName: 'files',
    );
  }
}
