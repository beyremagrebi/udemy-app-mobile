import '../../models/training_center/class_tc.dart';
import '../base/class_services.dart';

class ClassTcServices extends ClassServices<ClassTc> {
  ClassTcServices() : super(ClassTc.fromMap);

  @override
  String get getClassesUrl =>
      '$endpoint/$institution/classes/byRole/$scholarityConfigId';
}
