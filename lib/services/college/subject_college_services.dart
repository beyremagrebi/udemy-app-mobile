import 'package:erudaxis/models/lycee/subject_lycee.dart';
import 'package:erudaxis/services/base/subject_services.dart';

class SubjectCollegeServices extends SubjectServices<SubjectLycee> {
  SubjectCollegeServices() : super(SubjectLycee.fromMap);

  @override
  Map<String, dynamic>? get getSubjectQueryParams => {'page': 1, 'limit': 1000};
  @override
  String get getSubjectUrl =>
      '$endpoint/$institution/subjects-by-class-and-role';
}
