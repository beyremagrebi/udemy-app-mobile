import 'dart:io';

import 'package:erudaxis/core/config/ar_messages.dart';
import 'package:erudaxis/core/firebase/channel_notification.dart';
import 'package:erudaxis/presentation/utils/app/app_package_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:timeago/timeago.dart' as timeago;

class AppLaunch {
  static Future<void> preExecution() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await AppPackageInfo.initialize();
      await dotenv.load();
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyDRjuFVzINdaK4DUg6WWMYtNU0QU0uOMSY',
          appId: '1:192108255833:android:85441d2e94fe7af6c1ef48',
          messagingSenderId: '192108255833',
          projectId: 'erudaxis',
        ),
      );
      await ChannelNotification.initialize();
      timeago.setLocaleMessages('ar', ArMessages());
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
