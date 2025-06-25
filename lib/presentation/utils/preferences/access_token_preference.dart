import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/presentation/utils/preferences/base_preferences.dart';
import 'package:flutter/material.dart';

class AccessTokenPreference extends BasePreferences<String> {
  static final AccessTokenPreference _instance =
      AccessTokenPreference._internal();

  static AccessTokenPreference get shared => _instance;

  AccessTokenPreference._internal();
  @override
  String get key => sharedAcessTokenKey;

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
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
