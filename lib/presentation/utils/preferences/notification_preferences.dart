import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/presentation/utils/preferences/base_preferences.dart';
import 'package:flutter/widgets.dart';

class NotificationPreferences extends BasePreferences<int> {
  static final NotificationPreferences _instance =
      NotificationPreferences._internal();

  static NotificationPreferences get shared => _instance;

  String? notificationId;

  NotificationPreferences._internal();

  @override
  String get key {
    if (notificationId == null) {
      throw Exception('User ID is not set for NotificationPreferences');
    }
    return '$sharedNotificationKey-$notificationId';
  }

  Future<void> clearWithKey(String notificationId) async {
    try {
      await init();
      await prefs.remove(_buildKey(notificationId));
      debugPrint('${_buildKey(notificationId)} CLEARED');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<int?> load() async {
    try {
      await init();
      final value = prefs.getInt(key);
      return value;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> loadWithKey(String notificationId) async {
    try {
      await init();
      final value = prefs.getInt(_buildKey(notificationId));
      return value;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> save(int value) async {
    try {
      await init();
      await prefs.setInt(key, value);
      debugPrint('$key SAVED INTO SHARED');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> saveWithKey(String notificationId, int value) async {
    try {
      await init();
      await prefs.setInt(_buildKey(notificationId), value);
      debugPrint('${_buildKey(notificationId)} SAVED INTO SHARED');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void setNotificationId(String userId) {
    notificationId = userId;
  }

  String _buildKey(String notificationId) =>
      '$sharedNotificationKey-$notificationId';
}
