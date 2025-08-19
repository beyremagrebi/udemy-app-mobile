import 'package:erudaxis/models/lycee/lesson_lycee.dart';
import 'package:erudaxis/services/base/lesson_services.dart';

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
      '$endpoint/$institution/get-all-lessons-pagination';
}
