import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppLaunch {
  static Future<void> preExecution() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load();
      debugPrint('App initialization completed successfully');
    } on FileSystemException catch (err, stackTrace) {
      _handleError('Failed to load .env file', err, stackTrace);
    } on FormatException catch (err, stackTrace) {
      _handleError('Invalid .env file format', err, stackTrace);
    } on Exception catch (err, stackTrace) {
      _handleError(
          'Unexpected error during app initialization', err, stackTrace);
    }
  }

  static void _handleError(
      String message, Object error, StackTrace stackTrace) {
    debugPrint('$message: $error');
    debugPrintStack(label: error.toString(), stackTrace: stackTrace);
  }
}
