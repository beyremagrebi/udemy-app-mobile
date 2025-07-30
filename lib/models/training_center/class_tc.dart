import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/models/training_center/training_center_config.dart';

class ClassTc extends BaseClass {
  String? startDate;
  String? endDate;

  ClassTc({
    required super.id,
    super.name,
    super.scholarityConfigId,
    this.endDate,
    this.startDate,
    super.students,
  });
  ClassTc.fromId(String? id) : super(id: id);
  factory ClassTc.fromMap(dynamic map) {
    if (map is String) {
      return ClassTc.fromId(map);
    }

    return ClassTc(
      id: FromJson.string(map['_id']),
      name: FromJson.string(
        map['name'],
      ),
      students: FromJson.modelList(
        map['students'],
        User.fromMap,
      ),
      startDate: FromJson.string(
        map['startDate'],
      ),
      endDate: FromJson.string(
        map['endDate'],
      ),
      scholarityConfigId: FromJson.model(
        map['scholarityConfigId'],
        TrainingCenterConfig.fromMap,
      ),
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
