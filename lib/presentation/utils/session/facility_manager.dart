import 'package:erudaxis/models/global/facility.dart';
import 'package:erudaxis/providers/main/test.dart';
import 'package:erudaxis/services/global/facility_services.dart';

class FacilityManager {
  static late Facility facility;

  static Future<void> loadFacility(String? id) async {
    await globalApiCall(
      apiCall: FacilityServices.shared.getFacilityById(id),
      onSuccess: (model) {
        facility = model;
      },
    );
  }
}
