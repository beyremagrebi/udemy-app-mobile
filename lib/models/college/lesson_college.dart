import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base/base_lesson.dart';
import 'package:erudaxis/models/college/class_college.dart';
import 'package:erudaxis/models/global/user.dart';

import '../common/study_material.dart';

class LessonCollege extends BaseLesson {
  LessonCollege({
    required super.id,
    super.classe,
    super.description,
    super.instructor,
    super.isLocked,
    super.name,
    super.studyMaterials,
  });
  LessonCollege.fromId(String? id) : super(id: id);
  factory LessonCollege.fromMap(dynamic map) {
    if (map is String) {
      return LessonCollege.fromId(map);
    }
    return LessonCollege(
      id: FromJson.string(map['_id']),
      name: FromJson.string(map['title']),
      description: FromJson.string(map['description']),
      classe: FromJson.model(
        map['classId'],
        ClassCollege.fromMap,
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
