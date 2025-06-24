import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/services/base_service.dart';

class UserService extends BaseService<User> {
  static final UserService _instance = UserService._internal();

  static UserService get shared => _instance;

  UserService._internal();

  @override
  User Function(Map<String, dynamic> json) get fromMapFunction => User.fromMap;
}
