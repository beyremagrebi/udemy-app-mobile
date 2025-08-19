import 'package:erudaxis/models/college/subject_college.dart';
import 'package:erudaxis/services/base/subject_services.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';
import '../../models/global/user.dart';

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

  @override
  Future<ApiResponse<List<User>>> getInstructorsBysubject({
    String? subjectId,
    String? classId,
  }) async {
    return ApiService.instance.request<List<User>>(
      url: '$getInstructorBySubjectUrl/$classId/$subjectId',
      fromJson: (json) => (json as List).map<User>(User.fromMap).toList(),
    );
  }
}
