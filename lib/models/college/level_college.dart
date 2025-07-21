import 'package:erudaxis/core/api/from_json.dart';
import 'package:erudaxis/models/base/base_level.dart';
import 'package:erudaxis/models/base/base_scolarity_config.dart';

import '../../presentation/utils/session/facility_manager.dart';

class LevelCollege extends BaseLevel {
  LevelCollege({
    required super.id,
    super.code,
    super.name,
    super.scholarityConfigId,
  });
  LevelCollege.fromId(String? id) : super(id: id);

  factory LevelCollege.fromMap(dynamic map) {
    if (map is String) {
      return LevelCollege.fromId(map);
    }
    return LevelCollege(
      id: FromJson.string(map['_id']),
      code: FromJson.string(map['code']),
      scholarityConfigId: FromJson.model(
        map['scholarityConfigId'],
        (json) => BaseScolarityConfig.fromMap(
          json,
          FacilityManager.facility.type!,
        ),
      ),
    );
  }
}
