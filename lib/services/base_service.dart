import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';

import '../core/api/api_services.dart';

abstract class BaseService<Model extends BaseModel> {
  final ApiService api = ApiService.instance;

  String get endpoint => baseURl;
  Model Function(dynamic json) get fromMapFunction;
  String? get institution => FacilityManager.facility.type?.endpoint;
  String? get scholarityConfigId =>
      FacilityManager.facility.scholarityConfigId?.id;
}
