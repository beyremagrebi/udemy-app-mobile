import 'package:erudaxis/models/training_center/lesson_tc.dart';
import 'package:erudaxis/services/base/lesson_services.dart';

class LessonTcServices extends LessonServices<LessonTc> {
  LessonTcServices() : super(LessonTc.fromMap);

  @override
  Map<String, dynamic>? get getLessonQueryParams => {
        'scholarityConfigId': scholarityConfigId,
        'page': 1,
        'limit': 1000,
      };
  @override
  String get getLessonUrl =>
      '$endpoint/$institution/get-all-lessons-pagination';
}
