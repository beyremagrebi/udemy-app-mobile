import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base/base_subject.dart';

class SubjectCollege extends BaseSubject {
  SubjectCollege({
    required super.id,
    super.name,
  });
  SubjectCollege.fromId(String? id) : super(id: id);

  factory SubjectCollege.fromMap(dynamic map) {
    if (map is String) {
      return SubjectCollege.fromId(map);
    }
    return SubjectCollege(
      id: FromJson.string(map['_id']),
      name: FromJson.string(map['name']),
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
