import 'package:erudaxis/models/lycee/lesson_lycee.dart';
import 'package:erudaxis/services/base/lesson_services.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';

class LessonLyceeServices extends LessonServices<LessonLycee> {
  LessonLyceeServices() : super(LessonLycee.fromMap);
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
  Future<ApiResponse<List<LessonLycee>>> getLessonBySubjectAndClass({
    String? classId,
    String? subjectId,
  }) async {
    return ApiService.instance.request<List<LessonLycee>>(
      url: '$getLessonUrl/$classId',
      dataKey: 'data',
      queryParameters: {
        ...?getLessonQueryParams,
        'subjectType': 'Cours',
        'subjectId': subjectId
      },
      fromJson: (json) =>
          (json as List).map<LessonLycee>(LessonLycee.fromMap).toList(),
    );
  }
}
