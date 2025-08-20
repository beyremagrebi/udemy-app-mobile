import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base/base_subject.dart';
import 'package:erudaxis/models/college/subject_type_college.dart';

import '../base/base_subject_type.dart';

class SubjectCollege extends BaseSubject {
  List<BaseSubjectType>? subjectTypes;
  SubjectCollege({
    required super.id,
    super.name,
    this.subjectTypes,
  });
  SubjectCollege.fromId(String? id) : super(id: id);

  factory SubjectCollege.fromMap(dynamic map) {
    if (map is String) {
      return SubjectCollege.fromId(map);
    }
    return SubjectCollege(
      id: FromJson.string(map['_id']),
      name: FromJson.string(map['name']),
      subjectTypes: FromJson.modelList(
        map['types'],
        SubjectTypeCollege.fromMap,
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
