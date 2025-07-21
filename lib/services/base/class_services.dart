import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';
import '../../models/base/base_class.dart';
import '../base_service.dart';

abstract class ClassServices<T extends BaseClass> extends BaseService<T> {
  final T Function(dynamic json) _fromMap;

  ClassServices(this._fromMap);

  @override
  T Function(dynamic json) get fromMapFunction => _fromMap;

  String get getClassesUrl;
  Map<String, dynamic>? get getClassQueryParams;
  Future<ApiResponse<List<T>>> getClasses() async {
    return ApiService.instance.request<List<T>>(
      url: getClassesUrl,
      queryParameters: getClassQueryParams,
      fromJson: (json) => (json['data'] as List).map<T>(_fromMap).toList(),
    );
  }
}
