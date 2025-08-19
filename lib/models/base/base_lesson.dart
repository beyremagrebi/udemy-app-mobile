import 'package:erudaxis/models/base/base_class.dart';
import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/models/college/lesson_college.dart';
import 'package:erudaxis/models/common/study_material.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/models/lycee/lesson_lycee.dart';
import 'package:erudaxis/models/training_center/lesson_tc.dart';

import '../../core/enum/facility_type.dart';
import '../../presentation/utils/session/facility_manager.dart';

abstract class BaseLesson extends BaseModel {
  String? name;
  BaseClass? classe;
  String? description;
  List<StudyMaterial>? studyMaterials;
  bool? isLocked;
  User? instructor;
  BaseLesson({
    required super.id,
    this.classe,
    this.description,
    this.instructor,
    this.isLocked,
    this.name,
    this.studyMaterials,
  });

  factory BaseLesson.fromMap(dynamic map) {
    switch (FacilityManager.facility.type!) {
      case FacilityType.trainingCenter:
        return LessonTc.fromMap(map);
      case FacilityType.lycee:
        return LessonLycee.fromMap(map);
      case FacilityType.college:
        return LessonCollege.fromMap(map);
    }
  }
}
