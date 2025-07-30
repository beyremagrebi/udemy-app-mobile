import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';
import '../../models/global/user.dart';
import '../../models/training_center/class_tc.dart';
import '../base/class_services.dart';

class ClassTcServices extends ClassServices<ClassTc> {
  ClassTcServices() : super(ClassTc.fromMap);

  @override
  String get getClassesUrl =>
      '$endpoint/$institution/classes/byRole-pagination/$scholarityConfigId';

  @override
  Map<String, dynamic>? get getClassQueryParams => {'page': 1, 'limit': 1000};

  Future<ApiResponse<List<User>>> getStudentsByClass(String? classId) async {
    return ApiService.instance.request<List<User>>(
      url: '$endpoint/$institution/classes/$classId/students',
      queryParameters: getClassQueryParams,
      dataKey: 'students',
      fromJson: (json) => (json as List).map<User>(User.fromMap).toList(),
    );
  }
}
