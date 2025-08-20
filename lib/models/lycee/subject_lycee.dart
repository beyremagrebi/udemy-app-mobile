import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base/base_subject.dart';
import 'package:erudaxis/models/base/base_subject_type.dart';
import 'package:erudaxis/models/lycee/subject_type_lycee.dart';

class SubjectLycee extends BaseSubject {
  List<BaseSubjectType>? subjectTypes;
  SubjectLycee({required super.id, super.name, this.subjectTypes});
  SubjectLycee.fromId(String? id) : super(id: id);

  factory SubjectLycee.fromMap(dynamic map) {
    if (map is String) {
      return SubjectLycee.fromId(map);
    }
    return SubjectLycee(
      id: FromJson.string(map['_id']),
      name: FromJson.string(map['name']),
      subjectTypes: FromJson.modelList(
        map['types'],
        SubjectTypeLycee.fromMap,
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
