import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BasePreferences<T> {
  SharedPreferences? _prefs;
  String get key;

  SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception(
          'SharedPreferences not initialized. Did you forget to call load/save/remove?');
    }
    return _prefs!;
  }

  Future<void> clear() async {
    await init();
    try {
      await _prefs?.clear();
      debugPrint('CLEAR ALL SHARED');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> init() async {
    if (_prefs == null) {
      try {
        _prefs = await SharedPreferences.getInstance();
      } on Exception catch (e) {
        debugPrint('SharedPreferences init failed: $e');
      }
    }
  }

  Future<T?> load();

  Future<void> remove() async {
    await init();
    try {
      await _prefs?.remove(key);
      debugPrint('$key REMOVED FROM SHARED');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> save(T value);
}
