import '../../core/enum/facility_type.dart';
import '../base_model.dart';
import '../college/college_config.dart';
import '../lycee/lycee_config.dart';
import '../training_center/training_center_config.dart';

abstract class BaseScolarityConfig extends BaseModel {
  BaseScolarityConfig({required super.id});

  factory BaseScolarityConfig.fromMap(dynamic map, FacilityType type) {
    switch (type) {
      case FacilityType.trainingCenter:
        return TrainingCenterConfig.fromMap(map);
      case FacilityType.college:
        return CollegeConfig.fromMap(map);
      case FacilityType.lycee:
        return LyceeConfig.fromMap(map);
    }
  }
}
