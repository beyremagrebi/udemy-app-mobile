import 'package:erudaxis/models/global/facility.dart';
import 'package:erudaxis/services/base_service.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';

class FacilityServices extends BaseService<Facility> {
  static final FacilityServices _instance = FacilityServices._internal();

  static FacilityServices get shared => _instance;

  FacilityServices._internal();
  @override
  Facility Function(dynamic json) get fromMapFunction => Facility.fromMap;

  Future<ApiResponse<Facility>> getFacilityById(String? id) async {
    return ApiService.instance.request<Facility>(
      url: '$endpoint/getOneFacility/$id',
      fromJson: fromMapFunction,
    );
  }
}
