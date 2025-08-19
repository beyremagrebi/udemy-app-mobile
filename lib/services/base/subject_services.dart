import 'package:erudaxis/models/base/base_subject.dart';
import 'package:erudaxis/models/global/user.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';
import '../base_service.dart';

abstract class SubjectServices<T extends BaseSubject> extends BaseService<T> {
  final T Function(dynamic json) _fromMap;

  SubjectServices(this._fromMap);

  @override
  T Function(dynamic json) get fromMapFunction => _fromMap;

  String get getInstructorBySubjectUrl;
  Map<String, dynamic>? get getSubjectQueryParams;
  String get getSubjectUrl;
  Future<ApiResponse<List<User>>> getInstructorsBysubject({
    String? subjectId,
  }) async {
    return ApiService.instance.request<List<User>>(
      url: '$getInstructorBySubjectUrl/$subjectId',
      fromJson: (json) => (json as List).map<User>(User.fromMap).toList(),
    );
  }

  Future<ApiResponse<List<T>>> getSubjectsByClassAndRole({
    String? classId,
    String? userId,
  }) async {
    return ApiService.instance.request<List<T>>(
      url: '$getSubjectUrl/$classId/$userId',
      fromJson: (json) => (json as List).map<T>(_fromMap).toList(),
    );
  }
}
