import 'package:erudaxis/models/college/lesson_college.dart';
import 'package:erudaxis/services/base/lesson_services.dart';

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
      '$endpoint/$institution/subjects-by-class-and-role';
}
