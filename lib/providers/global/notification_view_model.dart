import 'package:erudaxis/models/global/notification.dart';
import 'package:erudaxis/presentation/utils/preferences/notification_preferences.dart';
import 'package:erudaxis/presentation/utils/snackbar_utils.dart';
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

  Future<void> deleteNotification(String? id) async {
    await makeApiCall(
      apiCall: NotificationService.shared.deleteNotification(id),
      displayShimmer: false,
      onSuccess: (listNotif) {
        notifications?.removeWhere(
          (notif) => notif.id == id,
        );
        update();
        SnackBarUtils.showSuccess(context, 'Notification detele avec suceee');
      },
    );
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

  Future<void> resetCount() async {
    notificationCount = 0;
    update();
  }

  Future<void> updateNotification(NotificationModel notification) async {
    if (notification.status == 'read') {
      return;
    }
    notification.status = 'read';
    await makeApiCall(
      apiCall: NotificationService.shared.updateNotification(notification),
      displayShimmer: false,
      onSuccess: (updatedNotification) {
        notifications ??= [];

        final index = notifications!.indexWhere(
          (n) => n.id == updatedNotification.id,
        );

        if (index != -1) {
          notifications![index] = updatedNotification;
        } else {
          notifications!.add(updatedNotification);
        }
      },
    );
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
