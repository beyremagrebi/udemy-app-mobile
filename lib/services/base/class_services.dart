import 'package:erudaxis/services/base_service.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';
import '../../models/base/base_class.dart';
import '../../models/college/class_college.dart';
import '../../models/lycee/class_lycee.dart';
import '../../models/training_center/class_tc.dart';

class ClassServices<T extends BaseClass> extends BaseService<T> {
  static final ClassServices<ClassTc> tc = ClassServices._(ClassTc.fromMap);

  static final ClassServices<ClassLycee> lycee =
      ClassServices._(ClassLycee.fromMap);

  static final ClassServices<ClassCollege> college =
      ClassServices._(ClassCollege.fromMap);

  final T Function(dynamic json) _fromMap;

  ClassServices._(this._fromMap);

  @override
  String get endpoint => '${super.endpoint}/$institution';
  @override
  T Function(dynamic json) get fromMapFunction => _fromMap;
  Future<ApiResponse<List<T>>> getClasses() async {
    return ApiService.instance.request<List<T>>(
      url: '$endpoint/classes/byRole/$scholarityConfigId',
      fromJson: (json) => (json as List).map<T>(_fromMap).toList(),
    );
  }
}
