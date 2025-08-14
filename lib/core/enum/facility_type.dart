import 'package:erudaxis/core/constants/constant.dart';

enum FacilityType {
  trainingCenter('centreDeFormation', 'training-company'),
  lycee('lycee', 'lycee'),
  college('college', 'college');

  final String databaseValue;
  final String endpoint;

  const FacilityType(this.databaseValue, this.endpoint);
  String localizedType() {
    switch (this) {
      case FacilityType.trainingCenter:
        return intl.trainingCenter;
      case FacilityType.lycee:
        return intl.lycee;
      case FacilityType.college:
        return intl.college;
    }
  }

  static FacilityType? fromBackendValue(String? value) {
    switch (value) {
      case 'centreDeFormation':
        return FacilityType.trainingCenter;
      case 'lycee':
        return FacilityType.lycee;
      case 'college':
        return FacilityType.college;
    }
    return null;
  }
}
