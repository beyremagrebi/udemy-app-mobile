import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/models/base_model.dart';

import '../core/api/api_services.dart';

abstract class BaseService<Model extends BaseModel> {
  final ApiService api = ApiService.instance;

  String get endpoint => baseURl;

  Model Function(Map<String, dynamic> json) get fromMapFunction;
}
