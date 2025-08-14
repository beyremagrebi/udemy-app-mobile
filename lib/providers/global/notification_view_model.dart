import 'package:erudaxis/models/global/notification.dart';
import 'package:erudaxis/presentation/utils/preferences/notification_preferences.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/global/notification_service.dart';

class NotificationViewModel extends BaseViewModel {
  int notificationCount = 0;

  String? _currentKey;
  List<NotificationModel>? notifications;

  NotificationViewModel(super.context) {
    loadNotifications();
  }

  Future<void> decrementNotifCount() async {
    notificationCount--;
    await _save();
    update();
  }

  Future<void> incrementNotifCount() async {
    notificationCount++;
    await _save();
    update();
  }

  Future<void> loadNotifications() async {
    await makeApiCall(
      apiCall: NotificationService.shared.getAllNotifications(),
      displayLoading: false,
      onSuccess: (listNotif) {
        notifications = listNotif;
      },
    );
  }

  Future<void> readAllNotifications() async {
    if (notificationCount != 0) {
      notificationCount = 0;
      if (_currentKey != null) {
        await NotificationPreferences.shared.clearWithKey(_currentKey!);
      }
      update();
    }
  }

  Future<void> updateNotificationKey({
    required String userId,
    required String facilityId,
  }) async {
    _currentKey = '$userId-$facilityId';
    await _load();
  }

  Future<void> _load() async {
    if (_currentKey != null) {
      notificationCount =
          await NotificationPreferences.shared.loadWithKey(_currentKey!) ?? 0;
    } else {
      notificationCount = 0;
    }
    update();
  }

  Future<void> _save() async {
    if (_currentKey != null) {
      await NotificationPreferences.shared
          .saveWithKey(_currentKey!, notificationCount);
    }
  }
}
