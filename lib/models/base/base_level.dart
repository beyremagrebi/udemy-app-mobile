import 'package:dio/dio.dart';
import 'package:erudaxis/models/base/base_scolarity_config.dart';
import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/models/college/level_college.dart';
import 'package:erudaxis/models/lycee/level_lycee.dart';

import '../../core/enum/facility_type.dart';
import '../../presentation/utils/session/facility_manager.dart';

abstract class BaseLevel extends BaseModel {
  String? name;
  String? code;
  BaseScolarityConfig? scholarityConfigId;
  BaseLevel({
    required super.id,
    this.code,
    this.name,
    this.scholarityConfigId,
  });
  factory BaseLevel.fromMap(dynamic map) {
    switch (FacilityManager.facility.type!) {
      case FacilityType.trainingCenter:
        return BaseLevel.fromMap(map);
      case FacilityType.lycee:
        return LevelLycee.fromMap(map);
      case FacilityType.college:
        return LevelCollege.fromMap(map);
    }
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
