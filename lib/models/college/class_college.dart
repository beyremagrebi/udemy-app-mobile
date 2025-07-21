import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/models/college/college_config.dart';
import 'package:erudaxis/models/college/level_college.dart';
import 'package:erudaxis/models/global/user.dart';

class ClassCollege extends BaseClass {
  int? groupNumber;
  LevelCollege? level;
  ClassCollege({
    required super.id,
    super.name,
    super.students,
    this.level,
    this.groupNumber,
    super.scholarityConfigId,
  });

  ClassCollege.fromId(String? id) : super(id: id);
  factory ClassCollege.fromMap(dynamic map) {
    if (map is String) {
      return ClassCollege.fromId(map);
    }
    return ClassCollege(
        id: FromJson.string(map['_id']),
        name: FromJson.string(map['name']),
        groupNumber: FromJson.integer(map['groupNumber']),
        level: FromJson.model(map['level'], LevelCollege.fromMap),
        scholarityConfigId:
            FromJson.model(map['scholarityConfigId'], CollegeConfig.fromMap),
        students: FromJson.modelList(map['students'], User.fromMap));
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
