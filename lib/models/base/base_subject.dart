import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/models/college/subject_college.dart';
import 'package:erudaxis/models/lycee/subject_lycee.dart';
import 'package:erudaxis/models/training_center/subject_tc.dart';

import '../../core/enum/facility_type.dart';
import '../../presentation/utils/session/facility_manager.dart';

abstract class BaseSubject extends BaseModel {
  String? name;
  BaseSubject({required super.id, this.name});

  factory BaseSubject.fromMap(dynamic map) {
    switch (FacilityManager.facility.type!) {
      case FacilityType.trainingCenter:
        return SubjectTc.fromMap(map);
      case FacilityType.lycee:
        return SubjectLycee.fromMap(map);
      case FacilityType.college:
        return SubjectCollege.fromMap(map);
    }
  }
}
