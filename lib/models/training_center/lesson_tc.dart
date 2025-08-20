import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base/base_lesson.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/models/training_center/class_tc.dart';

import '../common/study_material.dart';

class LessonTc extends BaseLesson {
  LessonTc({
    required super.id,
    super.classe,
    super.description,
    super.instructor,
    super.isLocked,
    super.name,
    super.studyMaterials,
  });
  LessonTc.fromId(String? id) : super(id: id);
  factory LessonTc.fromMap(dynamic map) {
    if (map is String) {
      return LessonTc.fromId(map);
    }
    return LessonTc(
      id: FromJson.string(map['_id']),
      name: FromJson.string(map['title']),
      description: FromJson.string(map['description']),
      classe: FromJson.model(
        map['classId'],
        ClassTc.fromMap,
      ),
      studyMaterials:
          FromJson.modelList(map['studyMaterials'], StudyMaterial.fromMap),
      isLocked: FromJson.boolean(map['isLocked']),
      instructor: FromJson.model(map['instructorId'], User.fromMap),
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
