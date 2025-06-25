import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BasePreferences<T> {
  late final SharedPreferences prefs;
  String get key;

  Future<void> clear() async {
    try {
      await prefs.clear();
      debugPrint('CLEAR ALL SHARED');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<T?> load();

  Future<void> remove() async {
    try {
      await prefs.remove(key);
      debugPrint('$key REMOVED FROM SHARED');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> save(T value);
}
