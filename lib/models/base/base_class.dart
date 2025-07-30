import 'package:erudaxis/core/enum/facility_type.dart';
import 'package:erudaxis/models/base/base_scolarity_config.dart';
import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/models/college/class_college.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/models/lycee/class_lycee.dart';
import 'package:erudaxis/models/training_center/class_tc.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';

abstract class BaseClass extends BaseModel {
  String? name;
  List<User>? students;
  BaseScolarityConfig? scholarityConfigId;
  BaseClass(
      {required super.id, this.name, this.scholarityConfigId, this.students});

  factory BaseClass.fromMap(dynamic map) {
    switch (FacilityManager.facility.type!) {
      case FacilityType.trainingCenter:
        return ClassTc.fromMap(map);
      case FacilityType.lycee:
        return ClassLycee.fromMap(map);
      case FacilityType.college:
        return ClassCollege.fromMap(map);
    }
  }

  bool get isCollege => FacilityManager.facility.type == FacilityType.college;

  bool get isLycee => FacilityManager.facility.type == FacilityType.lycee;

  bool get isTtrainingCenter =>
      FacilityManager.facility.type == FacilityType.trainingCenter;
}
