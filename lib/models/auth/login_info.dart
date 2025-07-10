import 'package:dio/dio.dart';
import 'package:erudaxis/models/base_model.dart';

import '../../core/api/from_json.dart';

class LoginInfo extends BaseModel {
  String? accessToken;
  String? refreshToken;
  LoginInfo({
    required super.id,
    this.accessToken,
    this.refreshToken,
  });
  LoginInfo.fromId(String? id) : super(id: id);
  factory LoginInfo.fromMap(dynamic map) {
    if (map is String) {
      return LoginInfo.fromId(map);
    }

    return LoginInfo(
        id: FromJson.string(map['_id']),
        accessToken: FromJson.string(map['accessToken']),
        refreshToken: FromJson.string(map['refreshToken']));
  }

  @override
  FormData toFormData() {
    throw UnimplementedError();
  }

  @override
  Map<String, Object> toMap() {
    throw UnimplementedError();
  }
}
