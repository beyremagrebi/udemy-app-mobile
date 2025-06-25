import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/presentation/utils/preferences/base_preferences.dart';
import 'package:flutter/material.dart';

class RefreshTokenPreference extends BasePreferences<String> {
  static final RefreshTokenPreference _instance =
      RefreshTokenPreference._internal();

  static RefreshTokenPreference get shared => _instance;

  RefreshTokenPreference._internal();
  @override
  String get key => sharedRefreshTokenKey;

  @override
  Future<String?> load() async {
    try {
      await init();
      final value = prefs.getString(key);

      return value;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> save(String value) async {
    try {
      await init();
      await prefs.setString(key, value);
      debugPrint('$key SAVED INTO SHARED');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
