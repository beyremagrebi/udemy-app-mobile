import 'package:erudaxis/models/global/message.dart';
import 'package:erudaxis/models/global/notification.dart';
import 'package:erudaxis/presentation/utils/preferences/chat_room_preference.dart';
import 'package:erudaxis/presentation/utils/preferences/notification_preferences.dart';
import 'package:erudaxis/presentation/utils/snackbar_utils.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:erudaxis/services/global/notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationViewModel extends BaseViewModel {
  int notificationCount = 0;
  int chatNotificationCount = 0;
  String? _currentKey;
  Map<String, int> roomChatCounts = {};
  List<NotificationModel>? notifications;
  Map<String, Message?> roomChatLatestMessage = {};

  NotificationViewModel(super.context) {
    loadNotifications();
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

  Future<void> incrementChatNotifCount({required RemoteMessage message}) async {
    chatNotificationCount++;
    final current = roomChatCounts[message.data['chatId'].toString()] ?? 0;
    roomChatCounts[message.data['chatId'].toString()] = current + 1;
    roomChatLatestMessage[message.data['chatId'].toString()] =
        Message(id: '', message: '${message.notification?.body?.toString()}');
    await _saveChatRoomNotification(message.data['chatId'].toString());
    update();
  }

  Future<void> incrementNotifCount() async {
    notificationCount++;
    await _save();
    update();
  }

  Future<void> loadAllRoomNotifications(List<String> roomIds) async {
    if (_currentKey == null) {
      return;
    }

    for (final roomId in roomIds) {
      final count =
          await ChatRoomPreference.shared.loadWithKey('$_currentKey-$roomId') ??
              0;
      roomChatCounts[roomId] = count;
    }

    chatNotificationCount =
        roomChatCounts.values.fold(0, (sum, value) => sum + value);

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

  Future<void> readAllChatRoomNotifications(String? roomId) async {
    if (roomChatCounts[roomId ?? ''] != 0) {
      roomChatCounts[roomId ?? ''] = 0;
      if (_currentKey != null) {
        await ChatRoomPreference.shared.clearWithKey('$_currentKey-$roomId');
      }
      chatNotificationCount =
          roomChatCounts.values.fold(0, (sum, value) => sum + value);
      update();
    }
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

  Future<void> _saveChatRoomNotification(String? roomId) async {
    if (_currentKey != null) {
      await ChatRoomPreference.shared.saveWithKey(
          '$_currentKey-$roomId', roomChatCounts[roomId ?? ''] ?? 0);
    }
  }
}
