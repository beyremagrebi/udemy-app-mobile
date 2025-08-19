import 'package:erudaxis/models/college/lesson_college.dart';
import 'package:erudaxis/services/base/lesson_services.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';

class LessonCollegeServices extends LessonServices<LessonCollege> {
  LessonCollegeServices() : super(LessonCollege.fromMap);

  @override
  Map<String, dynamic>? get getLessonQueryParams => {
        'scholarityConfigId': scholarityConfigId,
        'page': 1,
        'limit': 1000,
      };
  @override
  String get getLessonUrl =>
      '$endpoint/$institution/by-subject-type-pagination';

  @override
  Future<ApiResponse<List<LessonCollege>>> getLessonBySubjectAndClass({
    String? classId,
    String? subjectId,
  }) async {
    return ApiService.instance.request<List<LessonCollege>>(
      url: '$getLessonUrl/$classId',
      dataKey: 'data',
      queryParameters: {
        ...?getLessonQueryParams,
        'subjectType': 'Cours',
        'subjectId': subjectId
      },
      fromJson: (json) =>
          (json as List).map<LessonCollege>(LessonCollege.fromMap).toList(),
    );
  }
}
