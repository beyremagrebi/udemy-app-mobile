import 'package:erudaxis/models/college/subject_college.dart';
import 'package:erudaxis/services/base/subject_services.dart';

class SubjectCollegeServices extends SubjectServices<SubjectCollege> {
  SubjectCollegeServices() : super(SubjectCollege.fromMap);
  @override
  String get getInstructorBySubjectUrl =>
      '$endpoint/$institution/instructors-by-subject';
  @override
  Map<String, dynamic>? get getSubjectQueryParams => {'page': 1, 'limit': 1000};
  @override
  String get getSubjectUrl =>
      '$endpoint/$institution/subjects-by-class-and-role';
}
