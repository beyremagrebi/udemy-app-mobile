import 'package:erudaxis/models/global/user.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';
import '../../models/college/class_college.dart';
import '../base/class_services.dart';

class ClassCollegeServices extends ClassServices<ClassCollege> {
  ClassCollegeServices() : super(ClassCollege.fromMap);

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
