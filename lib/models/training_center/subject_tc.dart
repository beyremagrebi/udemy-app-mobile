import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base/base_subject.dart';

class SubjectTc extends BaseSubject {
  SubjectTc({
    required super.id,
    super.name,
  });
  SubjectTc.fromId(String? id) : super(id: id);

  factory SubjectTc.fromMap(dynamic map) {
    if (map is String) {
      return SubjectTc.fromId(map);
    }
    return SubjectTc(
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
