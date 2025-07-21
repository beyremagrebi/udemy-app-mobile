import 'package:dio/dio.dart';
import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/models/lycee/lycee_config.dart';

import '../../core/api/from_json.dart';
import '../global/user.dart';

class ClassLycee extends BaseClass {
  ClassLycee({
    required super.id,
    super.name,
    super.students,
    super.scholarityConfigId,
  });

  ClassLycee.fromId(String? id) : super(id: id);
  factory ClassLycee.fromMap(dynamic map) {
    if (map is String) {
      return ClassLycee.fromId(map);
    }
    return ClassLycee(
      id: FromJson.string(map['_id']),
      name: FromJson.string(map['name']),
      scholarityConfigId:
          FromJson.model(map['scholarityConfigId'], LyceeConfig.fromMap),
      students: FromJson.modelList(map['students'], User.fromMap),
    );
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
