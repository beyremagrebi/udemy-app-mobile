import 'package:dio/dio.dart';
import 'package:erudaxis/models/base/base_subject_type.dart';
import 'package:erudaxis/models/college/subject_college.dart';
import 'package:erudaxis/models/global/user.dart';

import '../../core/api/from_json.dart';

class SubjectTypeLycee extends BaseSubjectType {
  SubjectTypeLycee({
    required super.id,
    super.instructors,
    super.subject,
    super.type,
  });
  SubjectTypeLycee.fromId(String? id) : super(id: id);

  factory SubjectTypeLycee.fromMap(dynamic map) {
    if (map is String) {
      return SubjectTypeLycee.fromId(map);
    }
    return SubjectTypeLycee(
      id: FromJson.string(map['_id']),
      type: FromJson.string(map['type']),
      subject: FromJson.model(
        map['subject'],
        SubjectCollege.fromMap,
      ),
      instructors: FromJson.modelList(
        map['profs'],
        User.fromMap,
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
