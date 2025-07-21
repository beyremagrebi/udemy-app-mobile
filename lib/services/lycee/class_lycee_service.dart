import '../../models/lycee/class_lycee.dart';
import '../base/class_services.dart';

class ClassLyceeServices extends ClassServices<ClassLycee> {
  ClassLyceeServices() : super(ClassLycee.fromMap);

  @override
  String get getClassesUrl =>
      '$endpoint/$institution/classes/byRole-pagination/$scholarityConfigId';

  @override
  Map<String, dynamic>? get getClassQueryParams => {'page': 1, 'limit': 1000};
}
