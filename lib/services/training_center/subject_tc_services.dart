import 'package:erudaxis/models/training_center/subject_tc.dart';
import 'package:erudaxis/services/base/subject_services.dart';

class SubjectTcServices extends SubjectServices<SubjectTc> {
  SubjectTcServices() : super(SubjectTc.fromMap);
  @override
  Map<String, dynamic>? get getSubjectQueryParams => {'page': 1, 'limit': 1000};
  @override
  String get getSubjectUrl =>
      '$endpoint/$institution/subjects-by-class-and-role-mobile';
}
