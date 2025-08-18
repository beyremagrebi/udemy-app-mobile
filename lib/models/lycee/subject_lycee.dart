import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base/base_subject.dart';

class SubjectLycee extends BaseSubject {
  SubjectLycee({
    required super.id,
    super.name,
  });
  SubjectLycee.fromId(String? id) : super(id: id);

  factory SubjectLycee.fromMap(dynamic map) {
    if (map is String) {
      return SubjectLycee.fromId(map);
    }
    return SubjectLycee(
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
