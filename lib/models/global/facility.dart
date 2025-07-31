import 'package:dio/dio.dart';
import 'package:erudaxis/core/api/form_data_helper.dart';
import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base/base_scolarity_config.dart';
import 'package:erudaxis/models/base_model.dart';
import 'package:erudaxis/models/global/enterprise.dart';

import '../../core/enum/facility_type.dart';

class Facility extends BaseModel {
  String? name;
  FacilityType? type;
  BaseScolarityConfig? scholarityConfigId;
  Enterprise? enterprise;
  Facility({
    required super.id,
    this.name,
    this.scholarityConfigId,
    this.enterprise,
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
      enterprise: FromJson.model(map['enterpriseId'], Enterprise.fromMap),
      scholarityConfigId: FromJson.model(
        map['scholarityConfigId'],
        (json) => BaseScolarityConfig.fromMap(
          json,
          FacilityType.fromBackendValue(
            FromJson.string(map['type']),
          )!,
        ),
      ),
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
