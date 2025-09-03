import 'package:flutter/material.dart';

import '../../../core/constants/constant.dart';
import 'base_preferences.dart';

class ChatRoomPreference extends BasePreferences<int> {
  static final ChatRoomPreference _instance = ChatRoomPreference._internal();

  static ChatRoomPreference get shared => _instance;

  String? roomId;
  ChatRoomPreference._internal();
  @override
  String get key {
    if (roomId == null) {
      throw Exception('User ID is not set for ChatNotificationPrefernce');
    }
    return '$sharedChatRoomNotificationKey-$roomId';
  }

  Future<void> clearWithKey(String roomId) async {
    try {
      await init();
      await prefs.remove(_buildKey(roomId));
      debugPrint('${_buildKey(roomId)} CLEARED');
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

  Future<int?> loadWithKey(String roomId) async {
    try {
      await init();
      final value = prefs.getInt(_buildKey(roomId));
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

  Future<void> saveWithKey(String roomId, int value) async {
    try {
      await init();
      await prefs.setInt(_buildKey(roomId), value);
      debugPrint('${_buildKey(roomId)} SAVED INTO SHARED');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  String _buildKey(String roomId) => '$sharedChatRoomNotificationKey-$roomId';
}
