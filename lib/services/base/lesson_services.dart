import 'package:erudaxis/models/base/base_lesson.dart';
import 'package:erudaxis/services/base_service.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';

abstract class LessonServices<T extends BaseLesson> extends BaseService<T> {
  final T Function(dynamic json) _fromMap;

  LessonServices(this._fromMap);
  @override
  T Function(dynamic json) get fromMapFunction => _fromMap;

  Map<String, dynamic>? get getLessonQueryParams;
  String get getLessonUrl;

  Future<ApiResponse<List<T>>> getLessonBySubjectAndClass({
    String? classId,
    String? subjectId,
  }) async {
    return ApiService.instance.request<List<T>>(
      url: getLessonUrl,
      dataKey: 'data',
      queryParameters: {
        ...?getLessonQueryParams,
        'classeId': classId,
        'subjectId': subjectId
      },
      fromJson: (json) => (json as List).map<T>(_fromMap).toList(),
    );
  }
}
