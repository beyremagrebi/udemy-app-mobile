import 'package:erudaxis/models/global/facility.dart';
import 'package:erudaxis/presentation/utils/preferences/facility_preferences.dart';

import '../../../core/enum/facility_type.dart';

class FacilityManager {
  static late Facility facility;

  static Future<bool> checkFacilityExist() async {
    final ficilityId = await FacilityPreferences.shared.load();

    return ficilityId != null;
  }

  static Future<void> clear() async {
    await FacilityPreferences.shared.remove();
  }

  static T functionByFacility<T>({
    required T Function() trainingCenter,
    required T Function() lycee,
    required T Function() college,
  }) {
    switch (facility.type!) {
      case FacilityType.trainingCenter:
        return trainingCenter.call();

      case FacilityType.lycee:
        return lycee.call();

      case FacilityType.college:
        return college.call();
    }
  }

  static Future<void> initilizeFacility(Facility facilityLoaded) async {
    facility = facilityLoaded;
    await FacilityPreferences.shared.save(facilityLoaded.id!);
  }

  static Future<String?> load() async {
    return await FacilityPreferences.shared.load();
  }

  static T valueByFacility<T>({
    required T trainingCenter,
    required T college,
    required T lycee,
  }) {
    switch (facility.type!) {
      case FacilityType.trainingCenter:
        return trainingCenter;
      case FacilityType.college:
        return college;
      case FacilityType.lycee:
        return lycee;
    }
  }
}
