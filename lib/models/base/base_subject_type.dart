import 'package:erudaxis/models/base/base_subject.dart';
import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/models/college/subject_type_college.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/models/lycee/subject_type_lycee.dart';

import '../../core/enum/facility_type.dart';
import '../../presentation/utils/session/facility_manager.dart';

abstract class BaseSubjectType extends BaseModel {
  String? type;
  List<User>? instructors;
  BaseSubject? subject;
  BaseSubjectType({
    required super.id,
    this.instructors,
    this.subject,
    this.type,
  });

  factory BaseSubjectType.fromMap(dynamic map) {
    switch (FacilityManager.facility.type!) {
      case FacilityType.trainingCenter:
        return BaseSubjectType.fromMap(map);
      case FacilityType.lycee:
        return SubjectTypeLycee.fromMap(map);
      case FacilityType.college:
        return SubjectTypeCollege.fromMap(map);
    }
  }
}
