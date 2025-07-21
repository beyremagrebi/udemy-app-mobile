import 'package:erudaxis/models/base/base_level.dart';
import 'package:erudaxis/presentation/utils/session/facility_manager.dart';

import '../../core/api/from_json.dart';
import '../base/base_scolarity_config.dart';

class LevelLycee extends BaseLevel {
  LevelLycee({
    required super.id,
    super.name,
    super.code,
    super.scholarityConfigId,
  });

  LevelLycee.fromId(String? id) : super(id: id);

  factory LevelLycee.fromMap(dynamic map) {
    if (map is String) {
      return LevelLycee.fromId(map);
    }
    return LevelLycee(
      id: FromJson.string(map['_id']),
      code: FromJson.string(map['code']),
      scholarityConfigId: FromJson.model(
        map['scholarityConfigId'],
        (json) =>
            BaseScolarityConfig.fromMap(json, FacilityManager.facility.type!),
      ),
    );
  }
}
