import 'package:erudaxis/models/global/facility.dart';

class FacilityManager {
  static late Facility facility;

  static Future<void> initilizeFacility(Facility facilityLoaded) async {
    facility = facilityLoaded;
  }
}
