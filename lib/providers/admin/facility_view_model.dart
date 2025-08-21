import 'package:erudaxis/models/global/facility.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:flutter/widgets.dart';

import '../../presentation/splash_screen_view.dart';
import '../../presentation/utils/navigator_utils.dart';

class FacilityViewModel extends BaseViewModel {
  final SessionManager sessionManager;

  FacilityViewModel(super.context, {required this.sessionManager});

  Future<void> onSelect(Facility selected) async {
    await sessionManager.loadFacility(selected.id);
    final userId = sessionManager.user?.id;
    final facilityId = selected.id;
    if (userId != null && facilityId != null) {
      if (context.mounted) {
        navigateToDeleteTree(context, const SplashScreenView());
      }
    } else {
      debugPrint(
          'User or Facility ID is null, cannot set NotificationPreferences.');
    }
  }
}
