import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/form_data_helper.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base_model.dart';

import '../../core/enum/facility_type.dart';

class Facility extends BaseModel {
  String? name;
  FacilityType? type;

  Facility({
    required super.id,
    this.name,
    this.type,
  });

  Facility.fromId(String? id) : super(id: id);

  factory Facility.fromMap(dynamic map) {
    if (map is String) {
      return Facility.fromId(map);
    }
    return Facility(
      id: FromJson.string(map['_id']),
      type: FacilityType.fromBackendValue(FromJson.string(map['type'])),
      name: FromJson.string(map['name']),
    );
  }

  @override
  FormData toFormData() => toMap().toFormData();
  @override
  Map<String, Object> toMap() {
    throw UnimplementedError();
  }
}
