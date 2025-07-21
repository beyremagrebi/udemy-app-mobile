import '../../models/college/class_college.dart';
import '../base/class_services.dart';

class ClassCollegeServices extends ClassServices<ClassCollege> {
  ClassCollegeServices() : super(ClassCollege.fromMap);

  @override
  String get getClassesUrl =>
      '$endpoint/$institution/classes/byRole-pagination/$scholarityConfigId';
}
