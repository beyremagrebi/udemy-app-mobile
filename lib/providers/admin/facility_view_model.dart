import 'package:erudaxis/models/global/facility.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/providers/global/session_manager_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../global/notification_view_model.dart';

class FacilityViewModel extends BaseViewModel {
  final SessionManager sessionManager;

  FacilityViewModel(super.context, {required this.sessionManager});

  Future<void> onSelect(Facility selected) async {
    final notifViewModel =
        Provider.of<NotificationViewModel>(context, listen: false);
    await sessionManager.loadFacility(selected.id);

    final userId = sessionManager.user?.id;
    final facilityId = selected.id;
    if (userId != null && facilityId != null) {
      notifViewModel.updateNotificationKey(
        userId: userId,
        facilityId: facilityId,
      );
    } else {
      debugPrint(
          'User or Facility ID is null, cannot set NotificationPreferences.');
    }

    update();
  }
}
