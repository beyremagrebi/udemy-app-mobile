import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base/base_lesson.dart';
import 'package:erudaxis/models/common/study_material.dart';
import 'package:erudaxis/models/global/user.dart';
import 'package:erudaxis/models/lycee/class_lycee.dart';

class LessonLycee extends BaseLesson {
  LessonLycee({
    required super.id,
    super.classe,
    super.description,
    super.instructor,
    super.isLocked,
    super.name,
    super.studyMaterials,
  });
  LessonLycee.fromId(String? id) : super(id: id);
  factory LessonLycee.fromMap(dynamic map) {
    if (map is String) {
      return LessonLycee.fromId(map);
    }
    return LessonLycee(
      id: FromJson.string(map['_id']),
      name: FromJson.string(map['title']),
      description: FromJson.string(map['description']),
      classe: FromJson.model(
        map['classId'],
        ClassLycee.fromMap,
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
