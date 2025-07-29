import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/presentation/utils/preferences/base_preferences.dart';
import 'package:flutter/material.dart';

class FacilityPreferences extends BasePreferences<String> {
  static final FacilityPreferences _instance = FacilityPreferences._internal();

  static FacilityPreferences get shared => _instance;

  FacilityPreferences._internal();
  @override
  String get key => sharedFacilityKey;

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
