import '../../core/enum/facility_type.dart';
import '../base_model.dart';
import 'scholarity/college_config.dart';
import 'scholarity/lycee_config.dart';
import 'scholarity/training_center_config.dart';

abstract class ScholarityConfigBase extends BaseModel {
  ScholarityConfigBase({required super.id});

  factory ScholarityConfigBase.fromMap(dynamic map, FacilityType type) {
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
